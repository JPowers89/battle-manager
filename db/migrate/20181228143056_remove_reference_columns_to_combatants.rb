class RemoveReferenceColumnsToCombatants < ActiveRecord::Migration[5.2]
  def change
    remove_column :combatants, :combat_id_id
    remove_column :combatants, :character_id_id
  end
end
