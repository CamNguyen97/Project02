class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.integer :show_case
      t.date :date_movie
      t.boolean :status
      t.references :movie, index: true, foreign_key: true
      t.boolean :is_delete

      t.timestamps
    end
  end
end
