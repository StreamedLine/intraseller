class StatsController < ApplicationController
	def bullets
		@bullets = Bullet.created_by(current_user.id)
	end

	def answers
		@answers = Answer.created_by(current_user.id)
	end
end