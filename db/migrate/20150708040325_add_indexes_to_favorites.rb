class AddIndexesToFavorites < ActiveRecord::Migration
  def change
    add_index :favorites, :user_id
    add_index :favorites, :post_id
  end
end
