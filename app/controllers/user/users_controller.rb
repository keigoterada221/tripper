class User::UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
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
		@users = user.followings
	end

	def followers
		user = User.find(params[:id])
		@users = user.followers
	end

	def withdraw
	end

	def destroy
	end

	def favorite
		@favorites = Favorite.where(user_id: current_user.id)
	end

	private
	def user_params
		params.require(:user).permit(:name,:profile_image,:introduction,:phone_number,:email,:post_code,:address_city,:address_street)
	end

end
