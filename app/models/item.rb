class Item < ApplicationRecord
	has_many :categoryItems
	has_many :categories, :through => :categoryItems
	has_many :itemQuestions
	has_many :questions, :through => :itemQuestions
	has_many :links, as: :linkable
	has_many :tags, as: :tagable

	accepts_nested_attributes_for :links, reject_if: proc { |attributes| attributes['url'].blank? }

	

end
