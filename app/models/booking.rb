class Booking < ApplicationRecord
  belongs_to :passenger, class_name: "User", foreign_key: "passenger_id"
  belongs_to :flight

  validates :passenger_id, :flight_id, presence: true

  after_create :decrement_seats

  accepts_nested_attributes_for :passenger

  private

  # TODO: determine passengers arg
  def decrement_seats(passengers = 1)
    flight.available_seats -= passengers
    flight.save
  end
end
