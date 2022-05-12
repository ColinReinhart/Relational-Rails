class CreateResorts < ActiveRecord::Migration[5.2]
  def change
    create_table :resorts do |t|
      t.string :name
      t.string :location
      t.boolean :is_open
      t.integer :base_elevation
      t.integer :summit_elevation

      t.timestamps
    end
  end
end
