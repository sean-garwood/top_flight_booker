class BookingsController < ApplicationController
  def new
    Rails.logger.debug { "\e[1;31mparams: #{params}\nbooking params: #{booking_params}\e[0m" }
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
    params.require(:booking).permit(:flight_id, :passenger_id)
  end

  def logged_in_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to root_path, status: :unauthorized
    end
  end
end
