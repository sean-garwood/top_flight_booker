class FlightsController < ApplicationController
  def index
    @airports = Airport.all.pluck(:code, :id)
    # filter flights by:
    #  departure airport
    #  arrival airport
    #  available seats
    #  departure date (not time)
    @departure_dates = get_departure_dates
    @flights = Flight.search_by_airports(
               flight_params[:departure_airport], flight_params[:arrival_airport]).
               search_by_date(flight_params[:depart_date]).
                search_by_passengers(flight_params[:available_seats])
  end

  private
    def get_departure_dates
      # get all departure dates for all flights
      dates = Flight.pluck(:depart_time).map { |date| date.to_date }.uniq
      dates.map { |date| [ date.strftime("%m/%d/%Y"), date ] }.sort
    end

    def flight_params
      params.require(:flight)
        .permit(:depart_date, :available_seats,
                :departure_airport, :arrival_airport)
    end
end
