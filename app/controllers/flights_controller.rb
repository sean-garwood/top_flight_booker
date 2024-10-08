class FlightsController < ApplicationController
  def index
    @airports = Airport.all.pluck(:code, :id).map { |code, id| [ code, id ] }
    @departure_dates = get_departure_dates
    @flights = Flight.search_by_airports(
               flight_params[:departure_airport], flight_params[:arrival_airport]).
               search_by_date(flight_params[:depart_date]).
               search_by_passengers(flight_params[:available_seats])
    @available_seats = (1..4).to_a
  end

  private

  def get_departure_dates
    dates = Flight.pluck(:depart_time).map { |date| date.to_date }.uniq
    dates.map { |date| [ date.strftime("%m/%d/%Y"), date ] }.sort
  end

  def flight_params
    params.permit(:departure_airport, :arrival_airport, :available_seats, :depart_date)
  end
end
