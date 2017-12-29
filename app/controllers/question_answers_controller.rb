class QuestionAnswersController < ApplicationController
	def create
		question = Question.find(params[:question_id])
		@answer = question.answers.new(answer_params)
		add_user_to_answer

		if @answer.save
			flash[:notice] = 'Answer added'
		else
			flsh[:error] = 'Answer not added'
		end
		redirect_back fallback_location: root_path
	end

	def update

	end

	private

	def answer_params
		params.require(:answer).permit(:content)
	end

	def add_user_to_answer
		@answer.user_id = current_user.id
	end
end