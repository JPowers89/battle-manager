class CreateCombats < ActiveRecord::Migration[5.2]
  def change
    create_table :combats do |t|
      t.integer :round
      t.integer :duration
      t.string :name

      t.timestamps
    end
  end
end
