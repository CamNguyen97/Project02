class CreateCinemarooms < ActiveRecord::Migration[5.1]
  def change
    create_table :cinemarooms do |t|
      t.string :name
      t.text :descreption
      t.boolean :status
      t.integer :sum_of_row
      t.integer :sum_of_collum
      t.boolean :is_delete

      t.timestamps
    end
  end
end
