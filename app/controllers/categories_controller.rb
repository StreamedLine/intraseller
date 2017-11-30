class CategoriesController < ApplicationController
  def index
  	@categories = Category.all
  end

  def show
  	@category = Category.find(params[:id])
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)

  	if @category.save
  		redirect_to category_path(@category)
  	else
  		render :new
  	end
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def update
  	@category = Category.find(params[:id])

  	if @category.update(category_params)
  		redirect_to category_path(@category)
  	else
  		render :edit
  	end
  end

  private

  def category_params
  	params.require(:category).permit(
      :name, 
      items_attributes: [:bhsku, :mfrsku, :image, links_attributes: [:url]],
      tags_attributes: [:label]
    )
  end
end
