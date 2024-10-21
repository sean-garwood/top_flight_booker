class BookingsController < ApplicationController
  def new
    @flight = Flight.find(booking_params[:flight_id])
    @booking = Booking.new
    booking_params[:number_of_tickets].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flight = Flight.find(booking_params[:flight_id])
    @booking.number_of_tickets = @booking.passengers.size
    if @booking.save
      flash[:notice] = "Booking created!"
      redirect_to @booking
    else
      flash[:alert] = "Booking failed!"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.fetch(:booking, {}).permit(
      :flight_id,
      :number_of_tickets,
      passengers_attributes: [ :name, :email ])
  end
end
