class AddResortsToRuns < ActiveRecord::Migration[5.2]
  def change
    add_reference :runs, :resort, foreign_key: true
  end
end
