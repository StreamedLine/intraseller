class AnswersController < ApplicationController
	before_action :authenticate_user!
	
	def destroy
		@answer = Answer.find(params[:id])
		
		if @answer.user_id == current_user.id
			@answer.destroy
			flash[:notice] = 'Data removed'
		else
			flash[:error] = 'Only author can remove data'
		end
		redirect_back fallback_location: root_path
	end	

end