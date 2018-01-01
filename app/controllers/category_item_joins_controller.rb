class CategoryItemJoinsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @category_item = CategoryItem.find(params[:id])
  end

  def update
    @category_item = CategoryItem.find(params[:id])

    if @category_item.update(category_items_params)
      flash[:notice] = 'Note updated'
    else
      flash[:error] = 'Note not updated'
    end

    redirect_to category_path(@category_item.category)
  end

  private
  
  #used for join table
  def category_items_params
    params.require(:category_item).permit(:note)
  end

end