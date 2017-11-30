class ItemsController < ApplicationController
  def index
  	@items = Category.all
  end

  def show
  	@item = Category.find(params[:id])
  end

  def new
  	@item = Category.new
  end

  def create
  	@item = Category.new(item_params)

  	if @item.save
  		redirect_to item_path(@item)
  	else
  		render :new
  	end
  end

  def edit
  	@item = Category.find(params[:id])
  end

  def update
  	@item = Category.find(params[:id])

  	if @item.update(item_params)
  		redirect_to item_path(@item)
  	else
  		render :edit
  	end
  end

  private

  def item_params
  	params.require(:item).permit(:bhsku, :mfrsku, :image)

  end
end
