class FlightsController < ApplicationController
  def index
    @airports = Airport.all.pluck(:code, :id)
    # filter flights by:
    #   departure airport
    #  arrival airport
    #  available seats
    #  departure date (not time)
    @flights = Flight.search_by_airports(
               flight_params[:departure_airport], flight_params[:arrival_airport]).
               search_by_date(flight_params[:depart_date]).
                search_by_passengers(flight_params[:available_seats])
  end

  private
    def flight_params
      params.require(:flight)
        .permit(:depart_date, :available_seats,
                :departure_airport, :arrival_airport)
    end
end
