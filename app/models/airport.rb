class Airport < ApplicationRecord
  has_many :arrivals
  has_many :departures
  has_many :arriving_flights, through: :arrivals, source: :flight
  has_many :departing_flights, through: :departures, source: :flight
end
