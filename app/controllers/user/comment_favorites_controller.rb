class User::CommentFavoritesController < ApplicationController

	def create
		post = Post.find(params[:post_id])
		comment = Comment.find(params[:comment_id])
		comment_favorite = current_user.comment_favorites.new(user_id: current_user.id,post_id: post.id, comment_id: comment.id)
		comment_favorite.save
		redirect_to request.referer
	end

	def destroy
		post = Post.find(params[:post_id])
		comment = Comment.find(params[:comment_id])
		comment_favorite = current_user.comment_favorites.find_by(user_id: current_user.id,post_id: post.id,comment_id: comment.id)
		comment_favorite.destroy
		redirect_to request.referer
	end
end
