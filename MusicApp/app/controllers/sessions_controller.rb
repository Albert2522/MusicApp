class SessionsController < ApplicationController
  before_action :require_no_user, only: [:new, :create]

  def new
  end

  def create
    email = session_params[:email]
    password = session_params[:password]
    @user = User.find_by_credentials(email, password)
    if @user
      @user.reset_session_token!
      session[:session_token] = @user.session_token
      redirect_to user_url(@user)
    else
      flash.now[:notice] = "Invalid Login or Password"
      render :new
    end
  end

  def destroy
    session[:session_token] = nil
    redirect_to users_url
  end
  private
  def session_params
    params.require(:user).permit(:email, :password)
  end

end
