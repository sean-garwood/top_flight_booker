class BookingsController < ApplicationController
  def new
    Rails.logger.debug { "\e[1;31mparams: #{params.inspect}\nbooking params: #{booking_params.inspect}\e[0m" }
    @flight = Flight.find(booking_params[:flight_id])
    @booking = Booking.new(booking_params)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.passenger = current_user
    if @booking.save
      flash[:notice] = "Booking created!"
      redirect_to root_path
    else
      flash[:alert] = "Booking failed!"
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :passenger_id, :number_of_tickets)
  end
end
