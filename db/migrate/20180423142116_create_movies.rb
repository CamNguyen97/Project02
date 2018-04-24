class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.date :year_produced
      t.integer :broadcasting_time
      t.text :descreption
      t.string :trailer
      t.string :image
      t.boolean :status
      t.boolean :is_delete

      t.timestamps
    end
  end
end