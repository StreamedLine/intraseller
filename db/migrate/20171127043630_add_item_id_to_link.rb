class AddItemIdToLink < ActiveRecord::Migration[5.1]
  def change
  	add_column :links, :item_id, :integer
  end
end
