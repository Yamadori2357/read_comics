class Review < ApplicationRecord
  belongs_to :user
  belongs_to :comic
  validates :user_id,  presence: true
  validates :comic_id, presence: true
  validates :score,    presence: true
end
