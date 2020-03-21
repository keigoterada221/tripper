class RemovePostCodeFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :post_code, :integer
    remove_column :users, :prefecture_code, :integer
    remove_column :users, :address_city_string, :string
    remove_column :users, :address_street, :string
  end
end
