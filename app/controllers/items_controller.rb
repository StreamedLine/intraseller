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
  	@item = new_item_from_params

  	if save_item
  		redirect_to correct_item_path(@item)
  	else
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
  		redirect_to correct_item_path(@item)
  	else
  		render :edit
  	end
  end

  private

  def new_item_from_params
    Item.new(item_params)
  end

  def item_params
  	params.require(:item).permit(:bhsku, :mfrsku, :image, :links_attributes => [:url], tags_attributes: [:label, :id])
  end

  def correct_item_path(item)
    item_path(item)
  end

  def save_item
    @item.save
  end
end

#app/controllers/category_items_controller.rb

# class CategoryItemsController < ItemsController
#   def correct_item_path(item)
#     category_item_path(item)
#   end
#
#   def new_item_from_params
#     category.items.build(item_params)
#   end
#
#   def category
#     Category.find(params[:category_id])
#   end
# end