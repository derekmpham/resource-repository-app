class Tag < ApplicationRecord
  has_many :resource_tags
  has_many :resources, through: :resource_tags
end
