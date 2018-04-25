class CreateSeats < ActiveRecord::Migration[5.1]
  def change
    create_table :seats do |t|
      t.references :seat_type, index: true, foreign_key: true
      t.boolean :status
      t.boolean :is_delete

      t.timestamps
    end
  end
end
