class CreateBullets < ActiveRecord::Migration[5.1]
  def change
    create_table :bullets do |t|
      t.string :nugget
      t.references :bulletable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
