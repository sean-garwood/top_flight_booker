class Flight < ApplicationRecord
  has_one :arrival
  has_one :departure
  has_one :arrival_airport, through: :arrival, source: :airport
  has_one :departure_airport, through: :departure, source: :airport

  def self.departure_dates
    select("DISTINCT DATE(depart_time) as depart_date").order("depart_date").map(&:depart_date)
  end

  def self.search_by_airports(departure_airport_code, arrival_airport_code)
    joins(:departure_airport, :arrival_airport)
      .where(airports: { code: departure_airport_code })
      .where(arrival_airports_flights: { code: arrival_airport_code })
  end

  def self.search_by_depart_date(depart_date)
    where("DATE(depart_time) = ?", depart_date)
  end

  def self.search_by_available_seats(available_seats)
    where("available_seats >= ?", available_seats)
  end

  def self.search(departure_airport_code, arrival_airport_code, depart_date, available_seats)
    flights = search_by_airports(departure_airport_code, arrival_airport_code)
    flights = flights.search_by_depart_date(depart_date) if depart_date.present?
    flights = flights.search_by_available_seats(available_seats) if available_seats.present?
    flights
  end
end
