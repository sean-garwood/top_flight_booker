class FlightsController < ApplicationController
  def index
    @booking = Booking.new
    if flight_params.empty?
      @flights = Flight.all
    else
      @flights = Flight.search(flight_params[:departure_airport],
        flight_params[:arrival_airport],
        flight_params[:depart_date],
        flight_params[:available_seats])
    end
  end

  private

  def flight_params
    params.permit(:id, :commit, :departure_airport, :arrival_airport,
    :available_seats, :depart_date)
  end
end
