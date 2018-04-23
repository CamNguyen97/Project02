class CreateMovietypes < ActiveRecord::Migration[5.1]
  def change
    create_table :movietypes do |t|
      t.string :name
      t.boolean :status
      t.boolean :is_delete

      t.timestamps
    end
  end
end
