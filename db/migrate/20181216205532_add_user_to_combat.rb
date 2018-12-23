class AddUserToCombat < ActiveRecord::Migration[5.2]
  def change
    add_column :combats, :user_id, :integer
    add_foreign_key :user_id, :combats
  end
end
