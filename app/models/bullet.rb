class Bullet < ApplicationRecord
  belongs_to :bulletable, polymorphic: true, optional: true
end
