class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
  	@categories = Category.all
  end

  def show
  	@category = Category.find(params[:id])
  end

  def new
  	@category = Category.new
    @category.tags.build
  end

  def create
  	@category = new_from_params

  	if @category.save
      flash[:notice] = "Success! #{@category.name} added"
  		redirect_to category_path(@category)
  	else
      flash[:error] = "#{@category.errors.full_messages.first}"
  		render :new
  	end
  end

  def edit
  	@category = Category.find(params[:id])
    @category.tags.build
  end

  def update
  	@category = Category.find(params[:id])

  	if @category.update(category_params)
      flash[:notice] = "Success! #{@category.name} saved"
  		redirect_to category_path(@category)
  	else
      flash[:error] = "#{@category.errors.full_messages.first}"
  		render :edit
  	end
  end

  private

  def category_params
  	params.require(:category).permit(
      :name, 
      items_attributes: [:bhsku, :mfrsku, :image, links_attributes: [:url]],
      tags_attributes: [:label, :id]
    )
  end

  def new_from_params
    Category.new(category_params)
  end
end
