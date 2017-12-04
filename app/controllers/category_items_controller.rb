class CategoryItemsController < ItemsController
  private
  
  def new_or_existing_item_from_params
    @current_category = category
    @current_category.items.build(item_params)
  end

  def correct_item_path(item)
  	if @current_category
  		category_path(@current_category)
  	else
	    category_item_path(category, item)
	  end
  end

  def save_item
    @current_category.save
  end

  def category
    Category.find(params[:category_id])
  end

end