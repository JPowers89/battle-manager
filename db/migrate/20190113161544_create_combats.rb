class CreateCombats < ActiveRecord::Migration[5.2]
  def change
    create_table :combats do |t|
      t.integer :round, default: 1
      t.integer :duration, default: 1
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
