class User::CommentsController < ApplicationController

	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@comments = @post.comments
		comment = current_user.comments.new(comment_params)
		comment.post_id = @post.id
		if comment.save
			flash.now[:notice] = "コメントを投稿しました"
		else
			flash.now[:alert] = "コメントに失敗しました"
		end
		@post.create_notification_comment(current_user, comment.id)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comments = @post.comments
		comment = current_user.comments.find(params[:id])
		comment.post_id = @post.id
		if comment.destroy
			flash.now[:notice] = "コメントを削除しました"
		else
			flash.now[:alert] = "コメントの削除に失敗しました"
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
