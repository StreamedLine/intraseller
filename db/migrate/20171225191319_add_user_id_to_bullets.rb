class AddUserIdToBullets < ActiveRecord::Migration[5.1]
  def change
    add_column :bullets, :user_id, :integer
  end
end
