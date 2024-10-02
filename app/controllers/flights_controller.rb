class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |airport| [ airport.code, airport.id ] }

    if params[:departure_airport].present? && params[:arrival_airport].present?
      @flights = Flight.joins(:departure, :arrival)
                       .where(departures: { airport_id: params[:departure_airport] }, arrivals: { airport_id: params[:arrival_airport] })
    else
      @flights = Flight.all
    end
  end
end
