class WelcomeController < ApplicationController
  def home
  	@user_bullets = Bullet.created_by(current_user.id)
  	@user_answers = Answer.created_by(current_user.id)
  end
end
