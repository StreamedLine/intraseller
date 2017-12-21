class ComparisonsController < ApplicationController
	def show
		@comparison = target
	end

	def new
		@item = Item.find(params[:item_id])
		@comparison = @item.comparisons.new
		@available_items = Comparison.available_items_for(@item)
	end 

	def create
		@comparison = Comparison.new(comparison_params)

		if @comparison.save
			flash[:notice] = "Comparison saved"
			redirect_to comparison_path(@comparison)
		else
			flash[:error] = "Comparison not saved"
			redirect_to item_path(item)
		end
	end

	def update
		@comparison = Comparison.find(params[:id])

  	if @comparison.update(comparison_params)
      flash[:notice] = "Success comparison updated"
  		redirect_to comparison_path(@comparison)
  	else
      flash[:error] = "#{@comparison.errors.full_messages.first}"
  		redirect_to item_path(target)
  	end
	end

	private

	def comparison_params
		params.require(:comparison).permit(:item_id, :compared_id, :bullets_attributes => [:nugget])
	end

	def target
		if params[:item_id]
			#is the comparison_id
			#binding.pry
			Item.find(params[:item_id]).comparisons.find(params[:id]) if params[:id]
		else
			Comparison.find(params[:id])
		end
	end
end