class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    redirect_to events_url if current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
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
      redirect_to sign_in_url, notice: 'Invalid Username'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/events'
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
