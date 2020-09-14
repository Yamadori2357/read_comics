class Comic < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :author_name, presence: true
  validates :content, presence: true
  validates :genre, presence: true
end
