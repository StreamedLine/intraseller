class ComparisonsController < ApplicationController
	def index 
		@comparisons = Comparison.all
	end

	def show
		@comparison = Comparison.find(params[:id])
	end

	def create
		@comparison = Comparison.new

		if @comparison.save
			redirect_to comparison_path(@comparison)
		else
			binding.pry
		end
	end

	def update
	end

	private

	def comparison_params
		params.require(:comparison).permit(:item_id, :compared_id, :bullets_attributes => [:nugget])
	end
end