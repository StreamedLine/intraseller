require 'rails_helper'

RSpec.describe Question, type: :model do
    before(:all) do
		@item = Item.create(bhsku: 'SODSCHX90VB', mfrsku: 'DSCHX90V/B', image: 'https://static.bhphoto.com/images/images250x250/1481216759000_1137175.jpg')
		#add question
		@question = @item.questions.create(content: 'Which point and shoot cameras have built in GPS?')
	end

	it "has a 'content' attribute" do 
		expect(@question).to have_attribute(:content)
	end

	it "has items" do 
		expect(@question.items.first).to eq(@item)
	end
end
