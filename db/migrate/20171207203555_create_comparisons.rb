class CreateComparisons < ActiveRecord::Migration[5.1]
  def change
    create_table :comparisons do |t|
      t.integer :item_id
      t.integer :compared_id

      t.timestamps
    end
  end
end
