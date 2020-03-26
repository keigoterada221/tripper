class User::RelationshipsController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		follow = current_user.active_relationships.build(follower_id: params[:user_id])
		if follow.save
			flash.now[:notice] = "#{@user.name}さんをフォローしました"
		else
			flash.now[:alert] = "フォローに失敗しました"
		end
		@user.create_notification_follow(current_user)
	end

	def destroy
		@user = User.find(params[:user_id])
		follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
		if follow.destroy
			flash.now[:notice] = "#{@user.name}さんのフォローを解除しました"
		else
			flash.now[:alert] = "フォローの解除に失敗しました"
		end
	end
end
