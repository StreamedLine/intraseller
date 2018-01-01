class WelcomeController < ApplicationController
	before_action :authenticate_user!

  def home
  	@user_bullets = Bullet.created_by(current_user.id)
  	@user_answers = Answer.created_by(current_user.id)
  end

  def update_username
  	current_user.update(params.require(:user).permit(:username))
  	redirect_to '/home'
  end
end
