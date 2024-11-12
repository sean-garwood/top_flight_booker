class PassengerMailer < ApplicationMailer
  default from: "admin@topflightbooker.com"
  layout "mailer"

  # confirmation email to be sent after a booking is made
  def booking_confirmation_email
    @booking = params[:booking]
    @url = booking_url(@booking)
    @passengers = @booking.passengers
    @flight = @booking.flight
    debugger
    @passengers.each do |passenger|
      @passenger = passenger
      mail(to: passenger.email, subject: "Booking Confirmation | flight ##{@flight.id}")
    end
  end
end
