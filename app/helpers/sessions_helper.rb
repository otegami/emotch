module SessionsHelper
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by(uid: session[:user_id])
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: "ログインしてください"
  end
end
