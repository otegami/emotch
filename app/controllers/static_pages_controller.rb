class StaticPagesController < ApplicationController
  def home
    redirect_to tweets_path if logged_in?
  end

  def detail
  end
end
