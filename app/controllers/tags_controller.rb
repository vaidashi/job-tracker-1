class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag  = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
    if @tag.save
      flash[:success] = "#{@tag.title} added!"
      redirect_to tags_path
    else
      render :new
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy

    flash[:success] = "#{tag.title} was successfully deleted!"
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end
