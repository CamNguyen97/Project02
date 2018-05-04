class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.references :seat, index: true, foreign_key: true
      t.references :schedule, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :status
      t.boolean :is_delete, default:false


      t.timestamps
    end
  end
end
