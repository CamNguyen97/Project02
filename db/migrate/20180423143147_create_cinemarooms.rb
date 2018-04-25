class CreateCinemarooms < ActiveRecord::Migration[5.1]
  def change
    create_table :cinemarooms do |t|
      t.string :name
      t.text :descreption
      t.boolean :status
      t.integer :seat_of_1_sequence
      t.integer :num_of_sequence
      t.boolean :is_delete

      t.timestamps
    end
  end
end
