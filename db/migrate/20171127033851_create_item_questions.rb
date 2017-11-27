class CreateItemQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :item_questions do |t|
      t.integer :item_id
      t.integer :question_id

      t.timestamps
    end
  end
end
