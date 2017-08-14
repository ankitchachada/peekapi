class RemoveStartTimeAndEndTimeFromAssignments < ActiveRecord::Migration[5.1]
  def change
    remove_column :assignments, :start_time, :integer
    remove_column :assignments, :end_time, :integer
  end
end
