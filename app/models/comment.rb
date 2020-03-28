class Comment < ApplicationRecord
	default_scope -> { order(created_at: :desc) }
	belongs_to :user
	belongs_to :post
	has_many :comment_favorites,dependent: :destroy
	def comment_favorite_by?(user)
		comment_favorites.where(user_id: user.id,post_id: post.id).exists?
    end
    # 通知
	has_many :notifications, dependent: :destroy

	paginates_per 5
end
