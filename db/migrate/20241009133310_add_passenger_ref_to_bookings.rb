class AddPassengerRefToBookings < ActiveRecord::Migration[7.2]
  def change
    add_reference :bookings, :passenger, null: false, foreign_key: { to_table: :users }
  end
end
