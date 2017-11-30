class RemoveItemIdFromLinks < ActiveRecord::Migration[5.1]
  def change
    remove_column :links, :item_id, :integer
  end
end
