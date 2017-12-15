class Comparison < ApplicationRecord
	belongs_to :item
	belongs_to :compared, :class_name => 'Item'
	has_many :bullets, as: :bulletable

	#this saves each comparison both ways
	after_create do |record|
		record.compared.compared << record.item unless record.compared.compared.include? record.item
	end

	accepts_nested_attributes_for :bullets

	def to_compare(item)
		#return all items that have not yet been compared
	end
end
