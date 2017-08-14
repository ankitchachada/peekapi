class CreateTimeslots < ActiveRecord::Migration[5.1]
  def change
    create_table :timeslots do |t|
      t.integer :start_time
      t.integer :duration
      t.integer :availability, default: 0
      t.integer :customer_count, default: 0
      t.integer :end_time
      t.timestamps
    end
  end
end
