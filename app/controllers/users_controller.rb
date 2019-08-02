class UsersController < ApplicationController
  before_action :search_form, only: :show
  before_action :logged_in_user, only: :show

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.page(params[:page])
    @emo_tweets = @user.emo_tweets.page(params[:page])
  end
end
