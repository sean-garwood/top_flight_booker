class AddNumberOfTicketsToBookingsTable < ActiveRecord::Migration[7.2]
  def change
    # add an int col that has num of tickets to bookings table
    add_column :bookings, :number_of_tickets, :integer
  end
end
