class RemoveMovieIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :movie_id, :integer
  end
end
