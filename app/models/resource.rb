class Resource < ApplicationRecord
  belongs_to :user, foreign_key: "creator_id"
  has_many :favorites
  has_many :favoriters, through: :favorites, class_name: "User"
  has_many :resource_tags
  has_many :tags, through: :resource_tags
end
