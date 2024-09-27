class Flight < ApplicationRecord
  has_one :arrival
  has_one :departure
  has_one :arrival_airport, through: :arrival, source: :airport
  has_one :departure_airport, through: :departure, source: :airport
end
