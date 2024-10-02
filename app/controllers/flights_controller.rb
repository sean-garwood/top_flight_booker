class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |airport| [ airport.code, airport.id ] }
    # filter flights by:
    #   departure airport
    #  arrival airport
    #  available seats
    #  departure date (not time)
    @flights = Flight.search_by_airports(
               params[:departure_airport], params[:arrival_airport]).
               departs_at(params[:departure_date]).
               available(params[:available_seats])
  end
end
