class Answer < ApplicationRecord
	belongs_to :question
	belongs_to :user, optional: true
	
	validates :content, presence: true

	def self.created_by(user_id)
  	self.where(user_id: user_id)
  end
end
