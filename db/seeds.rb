AIRPORT_CODES = [ "BWI", "IAD", "LAX", "JFK", "ORD",
                  "ATL", "BOS", "LGA", "MCO", "TPA" ]
AVAILABLE_SEATS_RANGE = (1..10)
DAYS_UNTIL_DEPARTURE_RANGE = (1..30)
DURATION_RANGE = (30..300)
MINUTES_IN_DAY = 1440
PASSENGER_NAMES = [ "Alice", "Bob", "Charlie", "David", "Eve",
                    "Frank", "Grace", "Heidi", "Ivan", "Judy" ]
PASSENGER_EMAILS = PASSENGER_NAMES.map { |name| name.downcase + "@example.com" }
SEED_COUNT = AIRPORT_CODES.size

def make_airports
  AIRPORT_CODES.each do |code|
    Airport.find_or_create_by!(code: code)
  end
end

def make_flights
  SEED_COUNT.times do
    # can be any airport
    departure_airport = Airport.find_by(code: AIRPORT_CODES.sample)
    # arrival can't be the same as departure
    arrival_codes = AIRPORT_CODES.reject { |code| code == departure_airport.code }
    arrival_airport = Airport.find_by(code: arrival_codes.sample)
    Flight.create!(
      departure_airport: departure_airport,
      arrival_airport: arrival_airport,
      available_seats: rand(AVAILABLE_SEATS_RANGE),
      depart_time: Time.now + rand(DAYS_UNTIL_DEPARTURE_RANGE) * MINUTES_IN_DAY.minutes,
      duration: rand(DURATION_RANGE)
    )
  end
end

def make_passengers
  PASSENGER_NAMES.each do |name|
    Passenger.create!(name: name, email: name.downcase + "@example.com")
  end
end

make_airports
puts "Seeded #{Airport.count} airports"
make_flights
puts "Seeded #{Flight.count} flights"
make_passengers
puts "Seeded #{Passenger.count} passengers"
