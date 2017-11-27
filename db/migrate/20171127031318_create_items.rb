class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :bhsku
      t.string :mfrsku
      t.string :image

      t.timestamps
    end
  end
end
