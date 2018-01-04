class ItemQuestionsController < CategoriesController
  before_action :authenticate_user!
  
	def create 
		@category = Item.find(params[:category_id])
		@category.questions.build(question_params)
		super
	end

	def update
		super
	end

	private

  def new_from_params
    @category
  end

  def question_params
  	params.require(:question).permit(:content)
  end
end