class CreateScheduleTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :schedule_times do |t|
      t.string :start_time
      t.string :end_time
      t.boolean :status
      t.boolean :is_delete

      t.timestamps
    end
  end
end
