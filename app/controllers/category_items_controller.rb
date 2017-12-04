class CategoryItemsController < ItemsController
  def new
    @category = category
  end

  private
  
  def new_from_params
    @category = category
    @category.items.build(item_params)
  end

  def correct_item_path(item)
  	if @category
  		category_path(@category)
  	else
	    category_item_path(@category, item)
	  end
  end

  def save_item
    @category.save
  end

  def category
    Category.find(params[:category_id])
  end

end