class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(booking_params[:flight_id])
    @booking.flight = @flight
    if booking_params[:number_of_tickets]
      booking_params[:number_of_tickets].to_i.times { @booking.passengers.build }
    else
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @flight = Flight.find(booking_params[:flight_id])
    @booking.number_of_tickets = @booking.passengers.compact.size
    if @booking.save
      PassengerMailer.with(booking: @booking).booking_confirmation_email.deliver_later
      flash[:notice] = "Booking created!"
      redirect_to @booking
    else
      flash[:alert] = "Booking failed!"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private

  def booking_params
    params.fetch(:booking, {}).permit(
      :flight_id,
      :number_of_tickets,
      passengers_attributes: [ :name, :email ])
  end
end
