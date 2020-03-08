class Post < ApplicationRecord

	belongs_to :user
	has_many :favorites,dependent: :destroy
	def favorite_by?(user)
		# お気に入りの中にuser_id存在していたらtrue
		favorites.where(user_id: user.id).exists?
	end

	has_many :comments,dependent: :destroy

end
