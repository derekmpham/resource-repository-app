class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password_hash, :role)
  end


end
