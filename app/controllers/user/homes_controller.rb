class User::HomesController < ApplicationController

	def top
		if params[:sort_select] == "新着順"
			words = Post.search(params[:word_search])
		    @posts = words.all.order(created_at: :desc)
		elsif params[:sort_select] == "いいね数順"
			words = Post.search(params[:word_search])
			@posts = words.sort{|a,b| b.favorites.size <=> a.favorites.size}
    	elsif params[:sort_select] == "コメント数順"
    		words = Post.search(params[:word_search])
			@posts = words.sort{|a,b| b.comments.size <=> a.comments.size}
    	else
    		@posts = Post.all.order(created_at: :desc)
		end
	end

	def about
	end
end
