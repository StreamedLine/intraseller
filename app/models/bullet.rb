class Bullet < ApplicationRecord
  belongs_to :bulletable, polymorphic: true, optional: true
  belongs_to :user, optional: true

  validates :nugget, {presence: true}
end
