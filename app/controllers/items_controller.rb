class ItemsController < ApplicationController
  before_action :authenticate_user!
  
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
  	if @item.save
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
    item = Item.find_or_build_item_with_params(item_params)
  end

  def item_params
  	params.require(:item).permit(:bhsku, :mfrsku, :image, links_attributes: [:url], tags_attributes: [:label, :id], questions_attributes: [:content], bullets_attributes: [:nugget])
  end

  def correct_item_path(item)
    item_path(item)
  end
end