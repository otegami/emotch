class RankingsController < ApplicationController
  before_action :logged_in_user, only: :index
  before_action :search_form, only: :index
  def index
    @user = current_user
    @tweets = Tweet.unscoped.order(emotions_count: :desc).page(params[:page])
  end
end
