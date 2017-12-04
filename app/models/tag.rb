class Tag < ApplicationRecord
  belongs_to :taggable, polymorphic: true, optional: true
end
