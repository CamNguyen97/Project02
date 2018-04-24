class CreateMoviesMovietypes < ActiveRecord::Migration[5.1]
  def change
    create_table :movies_movietypes do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :movietype, index: true, foreign_key: true

      t.timestamps
    end
  end
end
