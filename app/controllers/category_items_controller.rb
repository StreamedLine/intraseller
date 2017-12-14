class CategoryItemsController < ItemsController
  def new
    @category = category
  end

  #used for join table
  def update
    if params[:category_item].present?
      @category = Category.find(params[:id])
      @category_item = CategoryItem.find(params[:category_id]) #category_id is actually category_item_id
      @category_item.update(category_items_params)
      redirect_to category_path(@category)
    else
      super
    end
  end

  private
  
  #used for join table
  def category_items_params
    params.require(:category_item).permit(:note)
  end

  #All of the below methods for when item is created within context of category
  def new_from_params
    @category = category
    @category.find_or_build_item_from_params(item_params)
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