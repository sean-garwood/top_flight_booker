require "test_helper"

class FlightTest < ActiveSupport::TestCase
  test "should not save flight without departure_airport_id" do
    flight = Flight.new
    assert_not flight.save, "Saved the flight without a departure_airport_id"
  end

  test "should not save flight without arrival_airport_id" do
    flight = Flight.new
    assert_not flight.save, "Saved the flight without a arrival_airport_id"
  end
end
