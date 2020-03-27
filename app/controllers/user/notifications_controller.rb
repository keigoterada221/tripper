class User::NotificationsController < ApplicationController
	def index
		notifications = current_user.passive_notifications
		notifications.where(checked: false).each do |notification|
			# update_attributesメソッドで複数のモデルを同時更新
			notification.update_attributes(checked: true)
		end
		@notifications = notifications.where(visitor_id: true_users).where.not(visitor_id: current_user.id).page(params[:page]).includes([:visitor,:visited,:post,:comment])
	end
end
