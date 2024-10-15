class Airport < ApplicationRecord
  has_many :departing_flights, class_name: "Flight", foreign_key: "departure_airport_id", inverse_of: :departure_airport
  has_many :arriving_flights, class_name: "Flight", foreign_key: "arrival_airport_id", inverse_of: :arrival_airport

  validates :code, presence: true, format: { with: /\A[A-Z]{3}\z/, message: "must be three uppercase letters" }

  scope :arrival_codes, -> { joins(:arriving_flights).distinct.pluck(:code).sort }
  scope :departure_codes, -> { joins(:departing_flights).distinct.pluck(:code).sort }
end
