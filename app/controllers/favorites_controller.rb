class FavoritesController < ApplicationController

  include SessionsHelper

  def index
    @favorites = Favorite.all
  end

  def new
    @favorite = Favorite.new
  end

  def create
    p params
    @favorite = Favorite.new()
    if request.xhr?
      @favorite = Favorite.new(params[:resource_id])
      @favorite.favoriter_id = current_user.id
    else
      respond_to do |format|
        if @favorite.save
          format.html { redirect_to resources_path, notice: 'Favorite was successfully created.' }
          format.json { render :'/resources/index', status: :created, location: @favorite }
        else
          format.html { render :new }
          format.json { render json: @favorite.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
  end

  private
  def favorite_params
    params.require(:favorite).permit(:favoriter_id, :resource_id)
  end

end
