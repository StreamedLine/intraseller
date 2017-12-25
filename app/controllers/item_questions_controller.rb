class ItemQuestionsController < ItemsController
  before_action :authenticate_user!
  
	def create 
		@item = Item.find(params[:item_id])
		@item.questions.build(question_params)
		super
	end

	def update
		item = Item.find(params[:item_id])
		@question = Question.find(params[:id])

		@answer = @question.answers.build(answer_params)
    @answer.user_id = current_user.id

		if @question.save 
      flash[:notice] = "Success! answer saved"
  	else
      flash[:error] = "#{item.errors.full_messages.first}"
  	end
  	redirect_to correct_item_path(item)
	end

	private

  def new_from_params
    @item
  end

  def question_params
  	params.require(:question).permit(:content)
  end

  def answer_params
  	params.require(:answer).permit(:content)
  end
end