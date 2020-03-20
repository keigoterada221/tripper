class Admin::UsersController < ApplicationController
	def index
		if params[:name_search] == nil
			@users = User.all
		else
			names = User.usersearch(params[:name_search])
			@users = names.all
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if params[:user_status] == "有効会員"
			@user.update(status: false)
		else
			@user.update(status: true)
		end
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		redirect_to request.referer
	end
end
