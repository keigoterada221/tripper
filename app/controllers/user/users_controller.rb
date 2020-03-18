class User::UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@posts = current_user.posts
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		@user.update(user_params)
		redirect_to user_path(current_user.id)
	end

	def index
	end

	def follows
		user = User.find(params[:id])
		@users = user.followings.order(created_at: :desc)
	end

	def followers
		user = User.find(params[:id])
		@users = user.followers.order(created_at: :desc)
	end

	def withdraw
	end

	def destroy
		user = current_user
		user.status = false
		user.save
		sign_out(user)
		redirect_to root_path
	end

	def favorite
		@favorites = Favorite.where(user_id: current_user.id).order(created_at: :desc)
	end

	private
	def user_params
		params.require(:user).permit(:name,:profile_image,:introduction,:phone_number,:email,:post_code,:address_city,:address_street)
	end

end
