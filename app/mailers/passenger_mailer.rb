class PassengerMailer < ApplicationMailer
  # https://stackoverflow.com/questions/7219732/rails-missing-host-to-link-to-please-provide-host-parameter-or-set-default-ur
  # adding config.action_mailer.default_url_options = { :host => "yourhost" }
  # to enviroment rb file
  # lol actually its in https://guides.rubyonrails.org/action_mailer_basics.html
  # section 2.7 - if i had read that far before checking SO
  # 
  # in test_email.rb, not sure why the link_to doesnt work without message, url as args

  include Rails.application.routes.url_helpers

  def welcome_email
    @passenger = params[:passenger]
    @flight = params[:flight]
    @flight_url = flight_url(@flight.id)


    mail(to: @passenger.email, subject: "You have booked a ticket")
  end
  def test_email
    @passenger = Passenger.first
    @flight = Flight.first
    @flight_url = flight_url(@flight)
    mail(to: @passenger.email, subject: "TESTING EMAIL") do |format|
      format.html { render }
      format.text { render  }
    end
  end
end
