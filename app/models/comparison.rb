class Comparison < ApplicationRecord
	belongs_to :item
	belongs_to :compared, :class_name => 'Item'

	#this saves each comparison both ways
	after_create do |record|
		record.compared.compared << record.item unless record.compared.compared.include? record.item
	end
end
