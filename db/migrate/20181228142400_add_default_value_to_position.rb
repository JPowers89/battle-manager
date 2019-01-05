class AddDefaultValueToPosition < ActiveRecord::Migration[5.2]
  def change
    change_column :combatants, :position, :integer, default: -1
  end
end
