class CreateStudios < ActiveRecord::Migration[5.1]
  def change
    create_table :studios do |t|
      t.string :name
      t.boolean :status
      t.boolean :is_delete, default:false

      t.timestamps
    end
  end
end
