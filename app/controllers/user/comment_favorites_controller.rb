class User::CommentFavoritesController < ApplicationController

	before_action :authenticate_user!

	def create
		post = Post.find(params[:post_id])
		@comment = Comment.find(params[:comment_id])
		comment_favorite = current_user.comment_favorites.new(user_id: current_user.id,post_id: post.id, comment_id: @comment.id)
		if comment_favorite.save
			flash.now[:notice] = "#{@comment.user.name}さんのコメントにいいねしました"
		else
			flash.now[:alert] = "コメントへのいいねに失敗しました"
		end
		# redirect_to request.referer
	end

	def destroy
		post = Post.find(params[:post_id])
		@comment = Comment.find(params[:comment_id])
		comment_favorite = current_user.comment_favorites.find_by(user_id: current_user.id,post_id: post.id,comment_id: @comment.id)
		if comment_favorite.destroy
			flash.now[:notice] = "#{@comment.user.name}さんのコメントへのいいねを取り消しました"
		else
			flash.now[:alert] = "コメントへのいいねを取り消しに失敗しました"
		end
		# redirect_to request.referer
	end
end
