class User::PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.save
		redirect_to posts_path
	end

	def index
		# フォローしているユーザーと自分の投稿
		@posts = Post.where(user_id: current_user.followings).or(Post.where(user_id: current_user.id))
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to post_path(@post.id)
	end

	def destroy
		post = Post.find(params[:id])
		post.destroy
		redirect_to user_path(current_user.id)
	end

	private
	def post_params
		params.require(:post).permit(:image,:title,:body)
	end
end
