class User < ApplicationRecord
  has_many :favorites
  has_many :resources, through: :favorites
  has_many :resources, foreign_key: "creator_id"

  validates :email, :presence => true, :uniqueness => true
  validates :password_hash, :presence => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end
  
end
