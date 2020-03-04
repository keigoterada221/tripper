class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :profile_image_id, :string
    add_column :users, :phone_number, :string
    add_column :users, :introduction, :text
    add_column :users, :post_code, :integer
    add_column :users, :prefecture_code, :integer
    add_column :users, :address_city, :string
    add_column :users, :address_street, :string
  end
end
