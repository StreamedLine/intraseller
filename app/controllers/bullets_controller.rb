class BulletsController < ApplicationController
	def create
		parent = item_or_comparison
		bullet = parent.bullets.build(bullets_params)
		bullet.user_id = current_user.id
		if parent.save
			flash[:notice] = 'Data added'
		else
			flash[:error] = 'Data removed'
		end	
		redirect_to send("#{parent.class.to_s.downcase}_path", parent)
	end

	def destroy
		@bullet = Bullet.find(params[:id])
		
		if @bullet.user_id == current_user.id
			@bullet.destroy
			flash[:notice] = 'Data removed'
		else
			flash[:error] = 'Only author can remove data'
		end
		redirect_back fallback_location: root_path
	end	

	private

	def bullets_params
		params.require(:bullet).permit(:nugget)
	end

	def item_or_comparison
		if params[:comparison_id].present?
			Comparison.find(params[:comparison_id])
		elsif params[:item_id].present?
			Item.find(params[:item_id])
		end
	end
end