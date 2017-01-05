class User < ApplicationRecord
  validates :email, :presence => true, :uniqueness => true
  validates :password_hash, :presence => true
  has_many :favorites
  has_many :resources, through: :favorites
  has_many :resources, foreign_key: "creator_id"
end
