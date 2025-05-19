class CreateBookings < ActiveRecord::Migration[8.0]
  def change
    create_table :bookings do |t|
      t.references :availability, null: false, foreign_key: true
      t.string :client_email
      t.string :status

      t.timestamps
    end
  end
end
