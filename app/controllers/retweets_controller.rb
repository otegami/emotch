class RetweetsController < ApplicationController
  before_action :logged_in_user, only: :create
  before_action :search_form, only: :create
  def create
    tweet = Tweet.find_by(params[:tweet_id])
    if current_user.share(tweet)
      flash[:notice] = "Success Retweet"
      redirect_to tweets_path
    else
      flash[:notice] = "Tweet fault"
      redirect_to tweets_path
    end
  end
end
