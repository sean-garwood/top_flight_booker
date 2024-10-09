class Airport < ApplicationRecord
  has_many :departing_flights, class_name: "Flight", foreign_key: "departure_airport_id"
  has_many :arriving_flights, class_name: "Flight", foreign_key: "arrival_airport_id"

  validates :code, presence: true

  # provide airport codes to be displayed
  def self.arrival_codes
    joins(:arriving_flights).distinct.pluck(:code).to_a.sort
  end

  def self.departure_codes
    joins(:departing_flights).distinct.pluck(:code).to_a.sort
  end
end
