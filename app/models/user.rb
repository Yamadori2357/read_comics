class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :active_relationships,  class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                    dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                    dependent:   :destroy
  has_many :following,   through: :active_relationships, 
                          source: :followed
  has_many :followers,   through: :passive_relationships,
                          source: :follower
  has_many :likes,     dependent: :destroy
  has_many :liked_microposts, through: :likes,
                          source: :micropost
  has_many :bookmarks, dependent: :destroy
  has_many :favorited_comics,  through: :bookmarks,
                          source: :comic
  has_many :reviews,   dependent: :destroy
  
  enum gender: { man: 0, woman: 1}
  
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save   :downcase_unique_name, :downcase_email
  before_create :create_activation_digest
  
  validates :name, presence: true, length: { maximum: 30 }
  VALID_UNIQUE_NAME_REGEX = /\A[a-z0-9_]+\z/i
  validates :unique_name, presence: true,
                        length: { in: 5..15 },
                        format: { with: VALID_UNIQUE_NAME_REGEX }, 
                        uniqueness: { case_sensitive: false }        
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_one_attached :profile_image
  has_one_attached :header_image
  # 表示用のリサイズ済み画像を返す
  def display_profile_image
    profile_image.variant(resize_to_fill: [60, 60])
  end
  
  def display_lit_profile_image
    profile_image.variant(resize_to_fill: [40, 40])
  end
  
  
  # 表示用のリサイズ済み画像を返す
  def display_header_image
    header_image.variant(resize_to_limit: [600, 200])
  end
  
  
  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # トークンがダイジェストと一致したらtrueを返す
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  # ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  # アカウントを有効にする
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # 有効化用のメールを送信する
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end
  
  # パスワード再設定の属性を設定する
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # パスワード再設定のメールを送信する
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
  # パスワード再設定の期限が切れている場合はtrueを返す
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
  
  # ユーザーのステータスフィードを返す
  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end
  
  # ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
  
  private
  
  # 一意ユーザ名をすべて小文字にする
    def downcase_unique_name
      self.unique_name.downcase!
    end
    
  # メールアドレスをすべて小文字にする
    def downcase_email
      self.email = email.downcase
    end

    # 有効化トークンとダイジェストを作成および代入する
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end

    
end
