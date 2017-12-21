class Comparison < ApplicationRecord
	belongs_to :item
	belongs_to :compared, :class_name => 'Item'
	has_many :bullets, as: :bulletable

	#this saves each comparison both ways
	after_create do |record|
		record.compared.compared << record.item unless record.compared.compared.include? record.item
	end

	accepts_nested_attributes_for :bullets, reject_if: proc { |attributes| attributes['nugget'].blank? }

	def self.available_items_for(item)
		Item.all - item.comparisons.map(&:compared) - [item]
	end

	def get_bullets
		reverse_comparison = Comparison.find_by(compared_id: self.item.id, item_id: self.compared.id)
		reverse_comparison.bullets + self.bullets
	end
end
