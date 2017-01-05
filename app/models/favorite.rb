class Favorite < ApplicationRecord
  belongs_to :user, foreign_key: "favoriter_id"
  belongs_to :resource
end
