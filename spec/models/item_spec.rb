require 'rails_helper'

RSpec.describe Item, type: :model do
	before(:all) do
		@category = Category.create(name: 'photo')
		#add 2 items to category
		@item = @category.items.create(bhsku: 'SODSCHX90VB', mfrsku: 'DSCHX90V/B', image: 'https://static.bhphoto.com/images/images250x250/1481216759000_1137175.jpg')
		#add link
		@item.links.create(url: 'https://www.bhphotovideo.com/c/product/1137175-REG/sony_dschx90v_b_cyber_shot_dsc_hx90v_digital_camera.html')
		#add question
		@item.questions.create(content: 'Which point and shoot cameras have built in GPS?')
	end

	it "has a bhsku" do 
		expect(@item).to have_attribute(:bhsku)
	end

	it "has an mfrsku" do 
		expect(@item).to have_attribute(:mfrsku)
	end

	it "has an image" do 
		expect(@item).to have_attribute(:image)
	end

	it "has a link" do
		expect(@item.links.count).to eq(1)
	end

	it "has questions" do 
		expect(@item.questions.count).to eq(1)
		@item.questions.create
		expect(@item.questions.count).to eq(2)
	end

	it "has categories" do
		expect(@item.categories.count).to eq(1)
		@item.categories.create
		expect(@item.categories.count).to eq(2)
	end

end
