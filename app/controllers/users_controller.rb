class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:user][:password_hash]
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/resources'
    else
      redirect_to '/users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password_hash, :role)
  end

  def check_favorites
    if current_user.favorites.include?(Favorite.find_by(favoriter_id: current_user.id,
      resource_id: ))
  end

end
