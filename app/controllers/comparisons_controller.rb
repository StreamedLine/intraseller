class ComparisonsController < ApplicationController
	def index 
		@comparisons = item.comparisons.all
	end

	def show
		@comparison = item.comparison.find(params[:id])
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
  		redirect_to item_path(item)
  	end
	end

	private

	def comparison_params
		params.require(:comparison).permit(:item_id, :compared_id, :bullets_attributes => [:nugget])
	end

	def item
		item = params[:item_id]
	end
end