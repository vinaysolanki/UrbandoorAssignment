class ChangeColumnTypeForAmenities < ActiveRecord::Migration[5.2]
  def change
    rename_column :amenities, :type, :amenity_type
  end
end
