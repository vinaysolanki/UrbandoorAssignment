class ChangeUnitToUnitType < ActiveRecord::Migration[5.2]
  def change
    rename_table :units, :unit_types
  end
end
