class AddPostIdToCommentFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :comment_favorites, :post_id, :integer
  end
end
