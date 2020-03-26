class Admin::PostsController < ApplicationController
	before_action :authenticate_admin!
	def index
		users = User.where(status: true)
		@posts = Post.where(user_id: users)
		# 投稿並び替えメソッド(application_controller)
		post_sort
	end
	def destroy
		post = Post.find(params[:id])
		post.destroy
		redirect_to request.referer
	end
	def show
		@post = Post.find(params[:id])
		@comments = @post.comments.sort{|a,b| b.comment_favorites.size <=> a.comment_favorites.size}
	end
end
