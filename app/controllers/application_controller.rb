class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    render "index"
  end

  def authorize
    redirect_to '/login' unless current_user
  end

end
