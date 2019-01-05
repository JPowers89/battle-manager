class AddCharacterIdToCombatant < ActiveRecord::Migration[5.2]
  def change
    add_reference :combatants, :character_id, foreign_key: true
  end
end
