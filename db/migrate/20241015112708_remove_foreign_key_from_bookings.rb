class RemoveForeignKeyFromBookings < ActiveRecord::Migration[7.2]
  def change
    # remove the foreign key constraint for users
    remove_foreign_key :bookings, :users, column: :passenger_id if foreign_key_exists?(:bookings, :users, column: :passenger_id)
  end
end
