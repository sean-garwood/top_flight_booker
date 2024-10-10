class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport", foreign_key: "departure_airport_id"
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: "arrival_airport_id"
  has_many :bookings

  scope :arrival_airports, ->(arrival_airport_code) do
    if arrival_airport_code.present?
      joins(:arrival_airport).where("airports.code = ?", arrival_airport_code)
    else
      all
    end
  end

  scope :departure_airports, ->(departure_airport_code) do
    if departure_airport_code.present?
      joins(:departure_airport).where("airports.code = ?", departure_airport_code)
    else
      all
    end
  end

  def self.departure_dates
    select("DISTINCT DATE(flights.depart_time) as depart_date").order("depart_date").map(&:depart_date)
  end

  def self.search_by_airports(departure_airport_code, arrival_airport_code)
    departure_airports(departure_airport_code)
      .arrival_airports(arrival_airport_code)
  end

  def self.search_by_depart_date(depart_date)
    depart_date.present? ? where("DATE(depart_time) = ?", depart_date) : all
  end

  def self.search_by_available_seats(available_seats)
    available_seats.present? ? where("available_seats >= ?", available_seats) : all
  end

  def self.search(departure_airport_code, arrival_airport_code, depart_date, available_seats)
    search_by_airports(departure_airport_code, arrival_airport_code).
      search_by_depart_date(depart_date).
      search_by_available_seats(available_seats)
  end
end
