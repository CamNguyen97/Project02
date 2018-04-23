class CreateStudios < ActiveRecord::Migration[5.1]
  def change
    create_table :studios do |t|
      t.string :name
      t.boolean :status
      t.references :moive, index: true, foreign_key: true
      t.boolean :is_delete

      t.timestamps
    end
  end
end
