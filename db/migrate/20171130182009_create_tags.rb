class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :label
      t.references :taggable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
