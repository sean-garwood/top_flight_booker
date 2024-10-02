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
end
