class Flight < ApplicationRecord
  has_one :arrival
  has_one :departure
  has_one :arrival_airport, through: :arrival, source: :airport
  has_one :departure_airport, through: :departure, source: :airport

  scope :search_by_airports, ->(departure_airport, arrival_airport) do
    if departure_airport.present? && arrival_airport.present?
      joins(:departure, :arrival)
        .where(departures: { airport_id: departure_airport }, arrivals: { airport_id: arrival_airport })
    else
      all
    end
  end

  scope :search_by_date, ->(date) do
    if date.present?
      where("flights.depart_time >= ? AND flights.depart_time <= ?",
            date.to_date.beginning_of_day, date.to_date.end_of_day)
    else
      all
    end
  end

  scope :search_by_passengers, ->(passengers) do
    if passengers.present?
      where("flights.available_seats >= ?", passengers)
    else
      all
    end
  end
end
