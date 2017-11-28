require 'rails_helper'

RSpec.describe User, type: :model do
    before(:all) do 
    	build(:user)
    end

end
