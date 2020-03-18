class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :comment_favorites,dependent: :destroy
# フォロー・フォロワー
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
# 通知
  # 自分からの通知
  has_many :active_notifications, class_name: "Notification", foreign_key: "visitor_id", dependent: :destroy
  # 相手からの通知
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
  # フォロー通知
  def create_notification_follow(current_user)
    followed = Notification.where(["visitor_id = ? and visited_id = ? and action = ?",current_user.id, id, "follow"])
    if followed.blank?
      notification = current_user.active_notifications.new(visited_id: id, action: "follow")
      notification.save
    end
  end

  # 退会済みユーザーのログイン不可
  def active_for_authentication?
    super && status?
  end
  attachment :profile_image
end
