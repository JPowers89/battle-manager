class AddColumnsToCombatant < ActiveRecord::Migration[5.2]
  def change
    add_column :combatants, :initiative, :integer
    add_column :combatants, :current_hp, :integer
    add_column :combatants, :position, :integer
    add_column :combatants, :active, :bool
    add_reference :combatants, :combat_id, foreign_key: true
  end
end
