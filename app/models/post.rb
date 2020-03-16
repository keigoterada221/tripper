class Post < ApplicationRecord

	belongs_to :user
	has_many :favorites,dependent: :destroy
	def favorite_by?(user)
		# お気に入りの中にuser_id存在していたらtrue
		favorites.where(user_id: user.id).exists?
	end

	has_many :comments,dependent: :destroy
	belongs_to :prefecture
	# モデルとアップローダーの紐付け
	mount_uploader :video, VideoUploader
	validates :title, :body, :presence => true

	attachment :image

	def self.search(search)
		if search
			Post.where(["title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%"])
		end
	end
end
