class CategoryQuestionsController < CategoriesController
  before_action :authenticate_user!
  
	def create 
		@category = Category.find(params[:category_id])
		@category.questions.build(question_params)
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