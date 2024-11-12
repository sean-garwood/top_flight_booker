class PassengerMailer < ApplicationMailer
  default from: "admin@topflightbooker.com"
  layout "mailer"

  # confirmation email to be sent after a booking is made
  def booking_confirmation_email
    @passengers = @booking.passengers
    @url = booking_url(@booking)
    @passengers.each do |passenger|
      mail(to: passenger.email, subject: "Booking Confirmation | flight ##{@booking.flight.id}")
    end
  end
end
