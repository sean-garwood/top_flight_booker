DEPARTURE_AIRPORT_CODES = [ "BWI", "IAD", "LAX", "JFK", "ORD", "SFO", "SEA", "MIA", "DFW", "ATL" ]
ARRIVAL_AIRPORT_CODES = [ "BOS", "LGA", "MCO", "TPA", "FLL", "DEN", "LAS", "PHX", "SLC", "MSP" ]
AVAILABLE_SEATS_RANGE = (1..4)
DAYS_UNTIL_DEPARTURE_RANGE = (1..30)
DURATION_RANGE = (30..1200)
FLIGHTS_COUNT = 10
MINUTES_IN_DAY = 1440

def make_airports
  airport_codes = DEPARTURE_AIRPORT_CODES + ARRIVAL_AIRPORT_CODES
  airport_codes.uniq.each do |code|
    Airport.find_or_create_by!(code: code)
  end
end

def make_flights
  FLIGHTS_COUNT.times do
    departure_airport = Airport.find_by(code: DEPARTURE_AIRPORT_CODES.sample)
    arrival_airport = Airport.find_by(code: ARRIVAL_AIRPORT_CODES.sample)
    Flight.create!(
      departure_airport: departure_airport,
      arrival_airport: arrival_airport,
      available_seats: rand(AVAILABLE_SEATS_RANGE),
      depart_time: Time.now + rand(DAYS_UNTIL_DEPARTURE_RANGE) * MINUTES_IN_DAY.minutes,
      duration: rand(DURATION_RANGE)
    )
  end
end

make_airports
make_flights
puts "Seeded #{Flight.count} flights"
