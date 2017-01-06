class SessionsController < ApplicationController
 include SessionsHelper
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.password == params[:password]
      login(@user)
      redirect_to '/resources'
    else
      redirect_to '/login'
    end
  end

  def destroy
    logout
    redirect_to '/login'
  end

end
