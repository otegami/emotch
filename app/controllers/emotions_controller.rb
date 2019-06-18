class EmotionsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]

  def index
    @user = current_user
    @tweets = current_user.emo_tweets.page(params[:page])
  end

  def create
  # when errors happen, use @emotion in view
    @tweet = Tweet.find(params[:tweet_id])
    current_user.emo(@tweet)
    # change response depending upon request
    respond_to do |format|
      format.html { redirect_to tweets_path }
      format.js
    end
  end
  def destroy
    @tweet = Tweet.find(params[:id])
    current_user.unemo(@tweet)
    # change response depending upon request
    respond_to do |format|
      format.html { redirect_to tweets_path }
      format.js
    end
  end
end
