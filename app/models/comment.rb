class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post
	has_many :comment_favorites,dependent: :destroy
	def comment_favorite_by?(user)
		comment_favorites.where(user_id: user.id,post_id: post.id).exists?
    end
end
