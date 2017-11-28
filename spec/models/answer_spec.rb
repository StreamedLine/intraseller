require 'rails_helper'

RSpec.describe Answer, type: :model do
  	before(:all) do
		@question = Question.create(content: 'Can it pause during video?')
		@answer = @question.answers.create(content: 'No.')
	end

	it "belongs to a question" do
		expect(@answer.question).to be(@question)
	end
end
