class CreateCombatants < ActiveRecord::Migration[5.2]
  def change
    create_table :combatants do |t|

      t.timestamps
    end
  end
end
