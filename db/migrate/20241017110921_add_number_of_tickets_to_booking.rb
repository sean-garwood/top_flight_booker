class AddNumberOfTicketsToBooking < ActiveRecord::Migration[7.2]
  def change
    change_table :bookings do |t|
      t.integer :number_of_tickets
    end
  end
end
