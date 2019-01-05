class FixColumnsOnCombatants < ActiveRecord::Migration[5.2]
  def change
    remove_column :combatants, :active
    add_column :combatants, :active, :bool
    add_reference :combatants, :combat, foreign_key: true
    add_reference :combatants, :character, foreign_key: true
  end
end
