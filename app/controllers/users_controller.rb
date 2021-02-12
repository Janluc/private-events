class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else  
      redirect_to new_user_url
    end
  end

  def new_sign_in
    @user = User.new
  end
  
  def sign_in
    @user = User.find_by(user_params)
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to sign_in_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end
