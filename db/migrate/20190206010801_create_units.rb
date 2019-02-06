class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.integer :beds
      t.integer :baths

      t.timestamps
    end
  end
end
