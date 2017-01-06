class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    respond_to do |format|
     if @tag.save
       format.html { redirect_to resources_path, notice: 'Tag was successfully created.' }
       format.json { render :'/resources/index', status: :created, location: @tag }
     else
       format.html { render :new }
       format.json { render json: @tag.errors, status: :unprocessable_entity }
     end
   end
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
