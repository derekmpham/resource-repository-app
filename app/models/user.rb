class User < ApplicationRecord
  has_many :favorites, foreign_key: "favoriter_id"
  has_many :resources, foreign_key: "creator_id"
end
