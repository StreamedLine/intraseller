class Question < ApplicationRecord
	has_many :categoryQuestions
	has_many :categories, :through => :categoryQuestions
	has_many :itemQuestions
	has_many :items, :through => :itemQuestions
	has_many :answers
	
	validates :content, presence: true
end
