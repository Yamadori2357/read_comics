class Comic < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :author_name, presence: true
  validates :content, presence: true
  validates :genre, presence: true
  has_one_attached :cover_image
  
  def display_cover_image
    cover_image.variant(resize_to_fill: [240, 326])
  end
  
  def display_litle_cover_image
    cover_image.variant(resize_to_fill: [100, 136])
  end
end
