class Notification < ApplicationRecord
	# 通知をデフォルトで新着順になるようにする
	default_scope -> {order(create_at: :desc)}
	# optional: true で nil を許可
	belongs_to :post, optional: true
	belongs_to :comment, optional: true
	# user.rbのフォローフォロワーと同じ要領
	belongs_to :visitor, class_name: "User", foreign_key: "visitor_id", optional: true
	belongs_to :visited, class_name: "User", foreign_key: "visited_id", optional: true
end
