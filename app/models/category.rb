class Category < ApplicationRecord
	has_many :categoryItems
	has_many :items, :through => :categoryItems
	has_many :categoryQuestions
	has_many :questions, :through => :categoryQuestions
	has_many :tags, as: :tagable

	# validates :name, {presence: true}

	def build_item
		item = self.items.build
		item.links.build
		item
	end
end
