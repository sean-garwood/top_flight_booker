require "test_helper"

class ArrivalTest < ActiveSupport::TestCase
  test "should not save arrival without flight_id" do
    arrival = Arrival.new
    assert_not arrival.save, "Saved the arrival without a flight_id"
  end

  test "should not save arrival without airport_id" do
    arrival = Arrival.new
    assert_not arrival.save, "Saved the arrival without flight_id"
  end
end
