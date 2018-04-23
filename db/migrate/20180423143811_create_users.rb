class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :password_digest
      t.string :remember_digest
      t.string :address
      t.string :phone
      t.boolean :status
      t.string :email
      t.integer :role, defaul: 0
      t.boolean :is_delete

      t.timestamps
    end
  end
end
