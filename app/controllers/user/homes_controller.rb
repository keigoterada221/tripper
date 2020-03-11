class User::HomesController < ApplicationController

	def top
		@posts = Post.all.order(created_at: :desc)
		if params[:sort_select] == "新着順"
		    @posts = Post.all.order(created_at: :desc)
		elsif params[:sort_select] == "いいね数順"
    		@posts = Post.find(Favorite.group(:post_id).order("count(post_id)desc").limit(10).pluck(:post_id))
    	elsif params[:sort_select] == "コメント数順"
    		@posts = Post.find(Comment.group(:post_id).order("count(post_id)desc").limit(10).pluck(:post_id))
		end
	end

	def about
	end

end
