class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  has_many :emotions, dependent: :destroy
  has_many :emo_tweets, through: :emotions, source: :tweet
  has_many :retweets, dependent: :destroy
  has_many :retweet_posts, through: :retweets, source: :tweet

  # create session with omniauth-twitter
  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:info][:nickname]
    image = auth[:info][:image]
    url = auth[:info][:urls][:Twitter]

    self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.name = name
      user.image = image
      user.url = url
    end
  end

  # emo tweet( like good in twitter, facebook )
  def emo(tweet)
    emo_tweets << tweet
  end

  # unemoo tweet ( remove good at tweet )
  def unemo(tweet)
    emotions.find_by(tweet_id: tweet.id).destroy
  end

  # check whether emo or not
  def emo?(tweet)
    emo_tweets.include?(tweet)
  end

  # share tweet to twitter by twitter API
  def share(tweet)
    # insert a tweet which user retweets into retweet_table
    retweet_posts << tweet
    # create twitter's client
    user = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = ENV['YOUR_ACCESS_TOKEN']
      config.access_token_secret = ENV['YOUR_ACCESS_SECRET']
    end
    user.update(tweet.content)

  end
end
