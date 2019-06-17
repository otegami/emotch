class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  has_many :emotions, dependent: :destroy
  has_many :emo_post, through: :emotions, source: :tweet

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
    emo_post << tweet
  end

  # unemoo tweet ( remove good at tweet )
  def unemo(tweet)
    emotions.find_by(tweet_id: tweet.id).destroy
  end

  # check whether emo or not
  def emo?(tweet)
    emo_post.include?(tweet)
  end
end
