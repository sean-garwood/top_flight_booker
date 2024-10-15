class Booking < ApplicationRecord
  belongs_to :flight
  has_and_belongs_to_many :passengers

  validates :flight_id, presence: true

  after_create :decrement_seats

  accepts_nested_attributes_for :passengers

  private

  # TODO: determine passengers arg
  def decrement_seats
    flight.available_seats -= passengers.count
    flight.save
  end
end
