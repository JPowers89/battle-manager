class AddActiveToCombats < ActiveRecord::Migration[5.2]
  def change
    add_column :combats, :active, :boolean, default: false
  end
end
