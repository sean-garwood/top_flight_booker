class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport", foreign_key: "departure_airport_id"
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: "arrival_airport_id"
  has_many :bookings

  def self.departure_dates
    select("DISTINCT DATE(flights.depart_time) as depart_date").order("depart_date").map(&:depart_date)
  end

  def self.search_by_airports(departure_airport_code, arrival_airport_code)
    joins("INNER JOIN airports departure_airports ON departure_airports.id = flights.departure_airport_id")
      .joins("INNER JOIN airports arrival_airports ON arrival_airports.id = flights.arrival_airport_id")
      .where("departure_airports.code = ?", departure_airport_code)
      .where("arrival_airports.code = ?", arrival_airport_code)
  end

  def self.search_by_depart_date(depart_date)
    where("DATE(flights.depart_time) = ?", depart_date)
  end

  def self.search_by_available_seats(available_seats)
    where("flights.available_seats >= ?", available_seats)
  end

  def self.search(departure_airport_code, arrival_airport_code, depart_date, available_seats)
    flights = search_by_airports(departure_airport_code, arrival_airport_code)
    flights = flights.search_by_depart_date(depart_date) if depart_date.present?
    flights = flights.search_by_available_seats(available_seats) if available_seats.present?
    flights
  end
end
