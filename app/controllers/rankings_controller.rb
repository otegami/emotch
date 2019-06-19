class RankingsController < ApplicationController
  before_action :logged_in_user, only: :index

  def index
    @user = current_user
    @tweets = Tweet.all.order(emotions_count: "DESC").page(params[:page])
  end
end
