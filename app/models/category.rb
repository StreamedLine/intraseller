class Category < ApplicationRecord
	has_many :categoryItems
	has_many :items, :through => :categoryItems
	has_many :categoryQuestions
	has_many :questions, :through => :categoryQuestions


end
