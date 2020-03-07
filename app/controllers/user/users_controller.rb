class User::UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = current_user
	end

	def update
		user = current_user
		user.update(user_params)
		redirect_to user_user_path(current_user.id)
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

	private
	def user_params
		params.require(:user).permit(:name,:introduction,:phone_number,:email,:post_code,:address_city,:address_street)
	end

end
