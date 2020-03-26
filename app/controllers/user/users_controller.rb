class User::UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :correct_user,{only:[:edit,:update]}

	def show
		@user = User.find(params[:id])
		@posts = @user.posts.includes([:prefecture]).page(params[:page])
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if @user.update(user_params)
			redirect_to user_path(current_user.id), notice: "プロフィールを更新しました"
		else
			render :edit
		end
	end

	def index
	end

	def destroy
		user = current_user
		user.status = false
		user.save
		sign_out(user)
		redirect_to root_path, notice: "Tripperを退会しました"
	end

	def follows
		user = User.find(params[:id])
		@users = user.followings.where(status: true)
	end

	def followers
		user = User.find(params[:id])
		@users = user.followers.where(status: true)
	end

	def user_search
		@users = User.users_search(params[:user_name_search]).where(status: true).page(params[:page])
	end

	def withdraw
	end

	def favorite
		@favorites = Favorite.where(user_id: current_user.id).order(created_at: :desc).includes([:post])
	end

	private

	def user_params
		params.require(:user).permit(:name,:profile_image,:introduction,:phone_number,:email,:post_code,:address_city,:address_street)
	end

	# URL直打ち防止
	def correct_user
	   if current_user.id != params[:id].to_i
	      redirect_to root_path, alert: "アクセスできません"
	   end
    end
end
