class AddNoteToCategoryItems < ActiveRecord::Migration[5.1]
  def change
    add_column :category_items, :note, :string
  end
end
