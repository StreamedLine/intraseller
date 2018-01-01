class Bullet < ApplicationRecord
  belongs_to :bulletable, polymorphic: true, optional: true
  belongs_to :user, optional: true

  validates :nugget, {presence: true}

  def self.created_by(user_id)
  	self.where(user_id: user_id)
  end
end
