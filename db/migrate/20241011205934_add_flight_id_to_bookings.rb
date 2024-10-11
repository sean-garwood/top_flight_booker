class AddFlightIdToBookings < ActiveRecord::Migration[7.2]
  def change
    add_reference :bookings, :flight, null: false, foreign_key: true
  end
end
