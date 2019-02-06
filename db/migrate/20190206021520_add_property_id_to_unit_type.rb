class AddPropertyIdToUnitType < ActiveRecord::Migration[5.2]
  def change
    add_column :unit_types, :property_id, :integer
    add_column :amenities, :property_id, :integer
  end
end
