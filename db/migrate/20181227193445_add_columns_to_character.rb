class AddColumnsToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :type, :String
    add_column :characters, :initiative, :integer
    add_column :characters, :max_hp, :integer
  end
end
