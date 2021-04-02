class PassengersController < ApplicationController

  def create
    @passenger = Passenger.create!(passenger_params)
    if @passenger.save
      # redirect etc
    else
    end
  end
  def test_email
      #PassengerMailer.test_email.deliver_later
      PassengerMailer.test_email.deliver_now
      redirect_to root_url
  end

  private
  def passenger_params
    params.require(:passenger).permit(:name, :email)
  end
end
