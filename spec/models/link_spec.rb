require 'rails_helper'

RSpec.describe Link, type: :model do
  before(:all) do
		@item = Item.create(bhsku: 'SODSCHX90VB', mfrsku: 'DSCHX90V/B', image: 'https://static.bhphoto.com/images/images250x250/1481216759000_1137175.jpg')
		@link = @item.links.create(url: 'https://www.bhphotovideo.com/c/product/1137175-REG/sony_dschx90v_b_cyber_shot_dsc_hx90v_digital_camera.html')
	end

	it "has a url" do 
		expect(@link).to have_attribute(:url)
		expect(@link.url).to eq("https://www.bhphotovideo.com/c/product/1137175-REG/sony_dschx90v_b_cyber_shot_dsc_hx90v_digital_camera.html")
	end

	it "has an item_id" do 
		expect(@link).to have_attribute(:item_id)
	end
end
