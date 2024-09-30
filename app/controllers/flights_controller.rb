class FlightsController < ApplicationController
  def index
    # TODO: filter flights by results from search form
    @flights = Flight.all
    @airports = Airport.all.map { |airport| [ airport.code, airport.id ] }
  end
end
