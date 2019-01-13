class CreateCombatants < ActiveRecord::Migration[5.2]
  def change
    create_table :combatants do |t|
      t.integer :initiative, default: 0
      t.integer :current_hp, default: 0
      t.integer :position, default: -1
      t.boolean :active, default: false
      t.string :name, null: false
      t.references :character, index: true, foreign_key: true
      t.belongs_to :combat, index: true, foreign_key: true
      t.timestamps
    end
    add_index :combatants, :name
  end
end
