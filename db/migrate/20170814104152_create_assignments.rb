class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.references :timeslot
      t.references :boat
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end
  end
end
