require 'rails_helper'

RSpec.describe Category, type: :model do
	before(:all) do
		#create a category
		@category = Category.create(name: 'photo')
		#add 2 items to category
		@category.items.build(bhsku: 'SODSCHX90VB', mfrsku: 'DSCHX90V/B', image: 'https://static.bhphoto.com/images/images250x250/1481216759000_1137175.jpg')
		@category.items.build(bhsku: 'NICPW300B', mfrsku: '26523', image: 'https://static.bhphoto.com/images/images250x250/1496213450000_1341600.jpg')
		#and finally
		@category.save
	end

	it "has a name" do 
		expect(@category).to have_attribute(:name)
	end

	it "has a correct name attribute" do 
		expect(@category).to have_attributes(:name => 'photo')
	end

	it "has 2 items" do 
		expect(@category.items.count).to eq(2)
	end
end
