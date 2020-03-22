class User::HomesController < ApplicationController

	def top
		# 地方リスト
		@prefectures = Prefecture.all
		@hokkaido = Prefecture.where(id: 1)
		@tohoku = Prefecture.where(id: 2..7)
		@kanto = Prefecture.where(id: 8..14)
		@chubu = Prefecture.where(id: 15..24)
		@kinki = Prefecture.where(id: 25..30)
		@chugoku = Prefecture.where(id: 31..35)
		@shikoku = Prefecture.where(id: 36..39)
		@kyusyu = Prefecture.where(id: 40..47)
		# 投稿並び替えメソッド(application_controller)
		post_sort
	end

	def prefecture
		@prefectures = Prefecture.where(id: params[:prefecture_code])
	    if params[:sort_select] == "新着順"
            @posts = Post.where(user_id: true_users)
        elsif params[:sort_select] == "いいね数順"
            @posts = Post.where(user_id: true_users).sort{|a,b| b.favorites.size <=> a.favorites.size}
        elsif params[:sort_select] == "コメント数順"
            @posts = Post.where(user_id: true_users).sort{|a,b| b.comments.size <=> a.comments.size}
        elsif params[:sort_select] == ""
            @posts = Post.where(user_id: true_users)
        else
            @posts = Post.where(prefecture_id: params[:prefecture_code],user_id: true_users)
        end
	end

	def about

	end
end
