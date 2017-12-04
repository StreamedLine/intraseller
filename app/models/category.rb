class Category < ApplicationRecord
	has_many :categoryItems
	has_many :items, :through => :categoryItems
	has_many :categoryQuestions
	has_many :questions, :through => :categoryQuestions
	has_many :tags, as: :taggable

	validates :name, {presence: true}

	accepts_nested_attributes_for :tags

	def build_item
		item = self.items.build
		item.links.build
		item.tags.build
		item
	end
end
