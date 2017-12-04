class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :feedback
      t.references :votable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
