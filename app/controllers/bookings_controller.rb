class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end
  def create
    @booking = Booking.create!(booking_params)
    if @booking.save
      # redirect etc
    else
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:flight, :passenger)
  end

end
