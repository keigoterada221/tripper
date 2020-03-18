class User::CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comments = @post.comments
		comment = current_user.comments.new(comment_params)
		comment.post_id = @post.id
		comment.save
		@post.create_notification_comment(current_user, comment.id)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comments = @post.comments
		comment = current_user.comments.find(params[:id])
		comment.post_id = @post.id
		comment.destroy
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
