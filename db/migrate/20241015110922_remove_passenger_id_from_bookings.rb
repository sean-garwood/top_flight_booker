class RemovePassengerIdFromBookings < ActiveRecord::Migration[7.2]
  def change
    change_table :bookings do |t|
      remove_column :bookings, :passenger_id, :integer
    end
  end
end
