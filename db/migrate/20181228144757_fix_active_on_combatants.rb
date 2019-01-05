class FixActiveOnCombatants < ActiveRecord::Migration[5.2]
  def change
    remove_column :combatants, :active
    add_column :combatants, :active, :bool
    #If i modify other columns on this table, the active column flips from boolean to text. huh...
  end
end
