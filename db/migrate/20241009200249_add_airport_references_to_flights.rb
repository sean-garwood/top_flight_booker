class AddAirportReferencesToFlights < ActiveRecord::Migration[7.2]
  def change
    add_reference :flights, :departure_airport, null: false, foreign_key: { to_table: :airports }
    add_reference :flights, :arrival_airport, null: false, foreign_key: { to_table: :airports }
  end
end
