class CreateRuns < ActiveRecord::Migration[5.2]
  def change
    create_table :runs do |t|
      t.string :name
      t.boolean :is_open
      t.boolean :has_moguls
      t.boolean :above_timberline
      t.string :difficulty
      t.integer :vertical_feet

      t.timestamps
    end
  end
end
