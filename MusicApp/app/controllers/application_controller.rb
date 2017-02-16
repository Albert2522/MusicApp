class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_no_user
    @user = current_user
    if @user
      redirect_to user_url(@user.id)
      session[:session_token] = @user.reset_session_token!
    end
  end

  def current_user
    return nil unless session[:session_token]
    User.find_by_session_token(session[:session_token])
  end

  def require_user
    redirect_to new_session_url
  end
end
