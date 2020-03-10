class AddVideoIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :video_id, :integer
  end
end
