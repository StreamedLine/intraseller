class ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  end

  def new
  	@item = Item.new
    @item.links.build
    @item.tags.build
  end

  def create
  	@item = new_from_params
    
  	if save_item
      flash[:notice] = "Success! #{@item.bhsku} saved"
  		redirect_to correct_item_path(@item)
  	else
      flash[:error] = "#{@item.errors.full_messages.first}"
  		render :new
  	end
  end

  def edit
  	@item = Item.find(params[:id])
    @item.links.build
    @item.tags.build
  end

  def update
  	@item = Item.find(params[:id])

  	if @item.update(item_params)
      flash[:notice] = "Success! #{@item.bhsku} updated"
  		redirect_to correct_item_path(@item)
  	else
      flash[:error] = "#{@item.errors.full_messages.first}"
  		render :edit
  	end
  end

  private

  def new_from_params
    item = Item.new(item_params)
  end

  def item_params
  	params.require(:item).permit(:bhsku, :mfrsku, :image, links_attributes: [:url], tags_attributes: [:label, :id], questions_attributes: [:content])
  end

  def correct_item_path(item)
    item_path(item)
  end

  def save_item
    @item.save
  end
end