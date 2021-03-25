class PassengersController < ApplicationController

  def create
    @passenger = Passenger.create!(passenger_params)
    if @passenger.save
      # redirect etc
    else
    end
  end

  private
  def passenger_params
    params.require(:passenger).permit(:name, :email)
  end
end
