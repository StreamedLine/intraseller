class CategoryItemsController < ItemsController
  before_action :authenticate_user!
  
  #item nested within category
  def new
    @category = category
  end

  #item nested within category
  def create
    #create category and item belonging to that category
    new_from_params
    if save_item
      flash[:notice] = "Success! #{@item.bhsku} saved"
      redirect_to correct_item_path(@item)
    else
      flash[:error] = "#{@item.errors.full_messages.first}"
      render :new
    end
  end

  #All of the below methods for when item is created within context of category
  def new_from_params
    @category = category
    @item = @category.find_or_build_item_from_params(item_params)
  end

  def correct_item_path(item)
    category_path(@category)
  end

  def save_item
    @category.save if @item.save
  end

  def category
    Category.find(params[:category_id])
  end

end