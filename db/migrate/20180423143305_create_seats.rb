class CreateSeats < ActiveRecord::Migration[5.1]
  def change
    create_table :seats do |t|
      t.string :num_of_row
      t.integer :num_of_collum
      t.boolean :seat_type
      t.references :cinemaroom, index: true, foreign_key: true
      t.boolean :status
      t.boolean :is_delete

      t.timestamps
    end
  end
end
