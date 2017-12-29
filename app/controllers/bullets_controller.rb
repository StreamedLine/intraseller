class BulletsController < ApplicationController
	def delete
		@bullet = Bullet.find(params[:id])
		if @bullet.user_id == current_user.id
			@bullet.destroy
			flash[:notice] = 'Data removed'
		else
			flash[:error] = 'Only author can remove data'
		end
		redirect_back fallback_location: root_path
	end	

end