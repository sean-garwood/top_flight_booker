# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

airport_codes = [ "BWI", "IAD", "LAX", "JFK", "ORD", "SFO", "SEA", "MIA", "DFW", "ATL" ]

airport_codes.each do |code|
  Airport.find_or_create_by!(code: code)
end

flight = Flight.find_or_create_by!(depart_time: "2024-09-27 17:00:00", duration: 323)

dep = Departure.find_or_create_by!(flight: flight, airport: Airport.find_by(code: "BWI"))
arr = Arrival.find_or_create_by!(flight: flight, airport: Airport.find_by(code: "LAX"))

puts "Seeded database with 10 airports, 1 flight, 1 departure, and 1 arrival."
puts "Flight #{flight.id} departs from #{dep.airport.code} and arrives at #{arr.airport.code}."
