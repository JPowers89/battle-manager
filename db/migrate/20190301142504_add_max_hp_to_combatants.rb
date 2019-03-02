class AddMaxHpToCombatants < ActiveRecord::Migration[5.2]
  def change
    add_column :combatants, :max_hp, :integer, default: 0
  end
end
