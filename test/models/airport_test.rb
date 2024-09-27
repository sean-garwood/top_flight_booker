require "test_helper"

class AirportTest < ActiveSupport::TestCase
  test "should not save airport without code" do
    airport = Airport.new
    assert_not airport.save, "Saved the airport without a code"
  end
end
