class User::PostsController < ApplicationController

	before_action :authenticate_user!
	before_action :correct_user_post,{only:[:edit,:update]}

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to posts_path, notice: "投稿に成功しました"
		else
			render :new, alert: "投稿に失敗しました"
		end
	end

	def index
		# フォローしているユーザーと自分の投稿
		@posts = Post.where(user_id: current_user.followings).or(Post.where(user_id: current_user.id)).or(Post.where(user_id: true_users)).includes([:user,:prefecture]).page(params[:page])
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
		@comments = @post.comments.where(user_id: true_users).includes([:user]).sort{|a,b| b.comment_favorites.size <=> a.comment_favorites.size}
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to post_path(@post.id), notice: "編集を保存しました"
		else
			render :edit, alert: "編集に失敗しました"
		end
	end

	def destroy
		post = Post.find(params[:id])
		if post.destroy
			redirect_to user_path(current_user.id), notice: "投稿を削除しました"
		else
			redirect_to request.referer, alert: "削除に失敗しました"
		end
	end

	private

	def post_params
		params.require(:post).permit(:title,:body,:video,:image,:prefecture_id,:destination)
	end
	# URL直打ち防止
	def correct_user_post
		if Post.find(params[:id]).user_id != current_user.id
			redirect_to root_path, alert: "アクセスできません"
		end
    end
end
