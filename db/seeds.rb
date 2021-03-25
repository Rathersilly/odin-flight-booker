# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

  Airport.create!(name: "San Fransisco International",
                  code: "SFO")
  Airport.create!(name: "New York JFK",
                  code: "JFK")
  Airport.create!(name: "Saskatoon JGD",
                  code: "YXE")
  Airport.create!(name: "Vancouver International",
                  code: "YVR")

  10.times do |i|
    from = Airport.all.sample
    to = Airport.all.reject{|x| x == from}.sample
    mon = 3
    day = 22 + i
    mon = 4 if day > 31
    day = day % 31 if day > 31
    time = rand(1..6) * 60 * 60

    Flight.create!(from_airport_id: from.id,
                   to_airport_id: to.id,
                   start: DateTime.new(2021, mon, day, 6,0,0),
                   duration:  time)
  end

  pas = Passenger.create!(name: "Bob Dobalina",
                    email: "bob@example.com")
  Booking.create!(passenger: pas,
                  flight: Flight.first)

  
