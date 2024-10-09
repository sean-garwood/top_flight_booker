class Airport < ApplicationRecord
  has_many :arrivals
  has_many :departures
  has_many :arriving_flights, through: :arrivals, source: :flight
  has_many :departing_flights, through: :departures, source: :flight

  validates :code, presence: true

  # provide airport codes to be displayed
  private

  def self.arrival_codes
    Airport.joins(:arrivals).pluck(:code).uniq.to_a.sort
  end

  def self.departure_codes
    Airport.joins(:departures).pluck(:code).uniq.to_a.sort
  end

  scope :departure_airports, -> { joins(:departures).distinct }
  scope :arrival_airports, -> { joins(:arrivals).distinct }
end
