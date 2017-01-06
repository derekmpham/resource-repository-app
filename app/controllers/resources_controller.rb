class ResourcesController < ApplicationController

  include SessionsHelper

  def index
    # @resources = Resource.joins(:favorites).group("resources.id").order("count(favorites.resource_id) desc")
    @resources = Resource.all
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.creator_id = current_user.id
    # Tag.all.each do
    #   @tag = Tag.new(parsed_tag_field)
    # @resource.tags
    respond_to do |format|
     if @resource.save
       format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
       format.json { render :show, status: :created, location: @resource }
     else
       format.html { render :new }
       format.json { render json: @resource.errors, status: :unprocessable_entity }
     end
   end
  end

  def new
    @resource = Resource.new
  end

  def show
    @resource = Resource.find(params[:id])
  end

  private
  def resource_params
    params.require(:resource).permit(:title, :url)
  end
end
