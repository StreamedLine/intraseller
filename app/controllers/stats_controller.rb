class StatsController < ApplicationController
	before_action :authenticate_user!
	
	def bullets
		@bullets = Bullet.created_by(current_user.id)
	end

	def answers
		@answers = Answer.created_by(current_user.id)
	end
end