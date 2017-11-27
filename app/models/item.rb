class Item < ApplicationRecord
	has_many :categoryItems
	has_many :categories, through: categoryItems
	has_many :links
end
