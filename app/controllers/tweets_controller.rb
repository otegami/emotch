class TweetsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]
  before_action :search_form, only: [:index, :create, :destroy]
  before_action :correct_user, only: :destroy
  def index
    @user = current_user
    @tweets = @q.result.includes(:user).page(params[:page])
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      flash[:success] = "Tweet created"
      redirect_to tweets_path
    else
      @user = current_user
      @tweets = Tweet.all
      flash[:error] = "Tweet fault"
      render 'tweets/index'
    end
  end

  def destroy
    @tweet.destroy
    flash[:success] = "Tweet deleted!"
    redirect_to request.referrer || root_url
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content, :image)
  end

  def correct_user
    @tweet = current_user.tweets.find_by(id: params[:id])
    redirect_to root_url if @tweet.nil?
  end
end
