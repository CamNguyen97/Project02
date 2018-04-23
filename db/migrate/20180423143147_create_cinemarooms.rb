class CreateCinemarooms < ActiveRecord::Migration[5.1]
  def change
    create_table :cinemarooms do |t|
      t.string :name
      t.text :descreption
      t.boolean :status
      t.references :schedule, index: true, foreign_key: true
      t.boolean :is_delete

      t.timestamps
    end
  end
end
