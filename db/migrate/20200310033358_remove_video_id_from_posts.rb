class RemoveVideoIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :video_id, :integer
  end
end
