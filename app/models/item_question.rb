class ItemQuestion < ApplicationRecord
	belongs_to :item 
	belongs_to :question
end
