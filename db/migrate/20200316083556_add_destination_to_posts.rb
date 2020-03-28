class AddDestinationToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :destination, :string
  end
end
