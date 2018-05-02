class CreateSeatTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :seat_types do |t|
      t.integer :pay_ticket
      t.string :name

      t.timestamps
    end
  end
end
