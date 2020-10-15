class Comic < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :author_name, presence: true
  validates :content, presence: true
  validates :genre, presence: true
  has_one_attached :cover_image
  has_many :bookmarks, dependent: :destroy
  has_many :favorited_users, through: :bookmarks, source: :user
  has_many :reviews,   dependent: :destroy
  
  def display_cover_image
    cover_image.variant(resize_to_fill: [240, 326])
  end
  
  def display_litle_cover_image
    cover_image.variant(resize_to_fill: [100, 136])
  end
  
  def favorite(user)
    bookmarks.create(user_id: user.id)
  end

  def unfavorite(user)
    bookmarks.find_by(user_id: user.id).destroy
  end
  
  def favorite?(user)
    favorited_users.include?(user)
  end
  
  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end
end
