class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.boolean :pets

      t.timestamps
    end
  end
end
