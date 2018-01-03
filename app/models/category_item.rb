class CategoryItem < ApplicationRecord
	belongs_to :category 
	belongs_to :item

	def category_name
		self.category.name
	end
end
