class User < ApplicationRecord
  has_many :favorites
  has_many :resources, through: :favorites
  has_many :resources, foreign_key: "creator_id"
end
