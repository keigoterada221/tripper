class Post < ApplicationRecord
	# デフォルトで新着順に並ぶようにする
	default_scope -> { order(created_at: :desc) }
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

	# 通知
	has_many :notifications, dependent: :destroy
		# お気に入り通知
	def create_notification_favorite(current_user)
			# すでにお気に入り登録されているか
		favorited = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ?", current_user.id, user_id, id, "favorite"])
			# お気に入りされていない場合のみ、通知のレコードを作成する
		if favorited.blank?
			notification = current_user.active_notifications.new(post_id: id,visited_id: user_id,action: "favorite")
				# 自分の投稿へのお気に入りは通知済みにする
			if notification.visitor_id == notification.visited_id
				notification.checked = true
			end
			notification.save
		end
	end
		# コメント通知
	def create_notification_comment(current_user, comment_id)
			# distinctはselectを使用しないと、データが重複する
		comments = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
		comments.each do |comment|
			save_notification_comment(current_user, comment_id, comment["user_id"] ) if comments.blank?
		end
		save_notification_comment(current_user, comment_id, user_id) if comments.blank?
	end

	def save_notification_comment(current_user, comment_id, visited_id)
			# お気に入りと違い複数回通知することを可能にする
		notification = current_user.active_notifications.new(post_id: id, comment_id: comment_id, visited_id: visited_id, action: "comment")
			# 自分の投稿へのコメントは通知済みにする
		if notification.visitor_id == notification.visited_id
			notification.checked = true
		end
		notification.save
	end

	# ワード検索機能
	def self.search(search)
		if search
			Post.where(["title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%"])
		end
	end
end
