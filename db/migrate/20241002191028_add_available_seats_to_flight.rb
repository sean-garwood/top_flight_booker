class AddAvailableSeatsToFlight < ActiveRecord::Migration[7.2]
  def change
    add_column :flights, :available_seats, :integer
  end
end
