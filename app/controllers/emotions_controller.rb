class EmotionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
  # when errors happen, use @emotion in view
    tweet = Tweet.find(params[:tweet_id])
    current_user.emo(tweet)
    redirect_to tweets_path
  end
  def destroy
    tweet = Tweet.find(params[:id])
    current_user.unemo(tweet)
    redirect_to tweets_path
  end
end
