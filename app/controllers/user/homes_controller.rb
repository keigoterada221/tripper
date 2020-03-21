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
		@prefecture = Prefecture.where(id: params[:prefecture_code])
      	users = User.where(status: true)
		@posts = Post.where(prefecture_id: params[:prefecture_code],user_id: users)
	end

	def about

	end
end
