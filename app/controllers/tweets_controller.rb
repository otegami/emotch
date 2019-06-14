class TweetsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]
  def index
    @user = current_user
    @tweet = Tweet.new
    @tweets = Tweet.all
  end

  def create
    tweet = current_user.tweets.build(tweet_params)
    if tweet.save
      flash[:success] = "Tweet created"
    else
      flash[:error] = "Tweet fault"
    end
    redirect_to tweets_path
  end

  def destroy
    
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content, :image)
  end
end
