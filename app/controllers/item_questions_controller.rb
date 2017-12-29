class ItemQuestionsController < ItemsController
  before_action :authenticate_user!
  
	def create 
		@item = Item.find(params[:item_id])
		@item.questions.build(question_params)
		super
	end

	def update
		super
	end

	private

  def new_from_params
    @item
  end

  def question_params
  	params.require(:question).permit(:content)
  end
end