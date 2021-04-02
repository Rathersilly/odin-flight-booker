class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end


  def new
    # new is for new instance of specific model
    # build is for creating a new instance withing an AR association (apparently)
    @booking = Booking.new
  end
  def create
    puts "CREATING"
    p params
    p booking_params
    p booking_params[:passenger]

    @passenger = Passenger.create(passenger_params)
    @booking = Booking.new(flight_id: booking_params[:flight_id],
                           passenger_id: @passenger.id)
    @flight = Flight.find(@booking.flight_id)

    if @booking.save
      puts "SAVED"
      PassengerMailer.with(passenger: @passenger, flight: @flight).welcome_email.deliver_later
      redirect_to root_url
      # redirect etc
    else
      puts "NOT SAVED"
      flash[:warning] = "somethings wrong"
      redirect_to root_url
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id)
  end
  def passenger_params
    params.require(:passenger).permit(:name, :email)
  end

end
