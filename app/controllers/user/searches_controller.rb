class User::SearchesController < ApplicationController
  # 投稿の並び替え(いいね数・コメント数)
  def posts_sort
    if params[:sort_select] == "いいね数順"
    @favorite_ranks = Post.find(Favorite.group(:post_id).order("count(post_id)desc").limit(10).pluck(:post_id))
    elsif params[:sort_select] == "コメント数順"
    @comment_ranks = Post.find(Comment.group(:post_id).order("count(post_id)desc").limit(10).pluck(:post_id))
    end
  end
end
