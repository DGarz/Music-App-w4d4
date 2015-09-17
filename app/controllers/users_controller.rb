class UsersController < ApplicationController

  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save!
      login_user!(@user)
      # session[session_token] = User.session_token
      render users_url(user)
    else
      # flash.now[:errors] = @user.errors.f
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end


end




# in cats controller
    # @cat = Cat.new(cat_params)
    # @cat.owner_id = current_user.id
