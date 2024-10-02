class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |airport| [ airport.code, airport.id ] }
    @flights = Flight.search_by_airports(params[:departure_airport], params[:arrival_airport])
  end
end
