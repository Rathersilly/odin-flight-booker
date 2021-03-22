class FlightsController < ApplicationController
  before_action :set_flight, only: %i[show edit update destroy]
  def index
    @flights = Flight.where(from_airport_id: params[:from_airport],
                           to_airport_id: params[:to_airport],
                           start: params[:start])
    @all_flights = Flight.all
    @flight = Flight.new
    # surely a better way to do this next line with query
    #@dates  = Flight.all.each_with_object([]) { |flight, memo| memo << flight.start }
  end

  def new
  end
  def create
  end
  def show
  end


  private
  def set_flight
    @flight = Flight.find(params[:id])
  end


  
end
