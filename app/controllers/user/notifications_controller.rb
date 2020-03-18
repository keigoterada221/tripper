class User::NotificationsController < ApplicationController
	def index
		notifications = current_user.passive_notifications
		notifications.where(checked: false).each do |notification|
			# update_attributesメソッドで複数のモデルを同時更新
			notification.update_attributes(checked: true)
		end
		@notifications = notifications.where.not(visitor_id: current_user.id)
	end
end
