class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
  end

  def create
    @resource = Resource.new(resource_params)
    # tags
    if params[:resource][:tags]
      input_tags = params[:resource][:tags].split(' ')
      input_tags.each do |input_tag|
        # create tag if not found in database
        Tag.create(name: input_tag) if !Tag.find(name: input_tag)
  
        #create resource_tag object in db for every tag associated with resource
        tag_obj = Tag.find(name: input_tag)
        ResourcetTag.create(resource_id: @resource.id, tag_id: tag_obj.id)
      end
    end

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
    params.require(:resource).permit(:title, :url, :tags)
  end
end