class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
              params[:user][:email],
              params[:user][:password])

    unless @user.nil?
      login_user!(@user)
      redirect_to user_url(@user)
    else
      #put some errors like username or password not recognized
      render :new
    end

  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end

end
