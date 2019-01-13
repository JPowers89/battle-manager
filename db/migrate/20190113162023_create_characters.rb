class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :type
      t.integer :initiative, default: 0
      t.integer :max_hp
      t.timestamps
    end
  end
end
