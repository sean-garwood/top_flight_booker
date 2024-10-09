class BookingsController < ApplicationController
  def new
    # designate the @flight instance to the one that was selected on the
    # previous page, flights#index
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params[:user_])
    @passenger = current_user
    @booking.save ? flash[:notice] = "Booking created!" : flash[:alert] = "Booking failed!"
    redirect_to root_path
  end
end
