class FixDefaultsOnCombatants < ActiveRecord::Migration[5.2]
  def change
    change_column :combatants, :current_hp, :integer, default: 0
    change_column :combatants, :initiative, :integer, default: 0
  end
end
