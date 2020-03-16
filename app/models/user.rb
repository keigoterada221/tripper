class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :comment_favorites,dependent: :destroy
  # フォローする側
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  # フォローされる側
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  # フォロー済みかどうかを判定
  def followed_by?(user)
  	passive_relationships.find_by(following_id: user.id).present?
  end
  # 退会済みユーザーのログイン不可
  def active_for_authentication?
    super && status?
  end
  attachment :profile_image
end
