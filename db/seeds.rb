# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cab.create([{ reg_num: 'KA452134', status: 'available', lat: 9.997090, long: 76.302815, color: 'pink' },
            { reg_num: 'KA452344', status: 'booked', lat: 9.997090, long: 76.302815 },
            { reg_num: 'KA451334', status: 'available', lat: 9.998480, long: 9.998480 },
            { reg_num: 'KA452304', status: 'available', lat: 10.057906, long: 76.346362 }])

Customer.create([{ name: 'customer1' },
                 { name: 'customer2' }])

Trip.create([{ cab: Cab.first, customer: Customer.first, status: 'scheduled' },
             { cab: Cab.last, customer: Customer.last, status: 'started' },
             { cab:  Cab.last, customer: Customer.first, status: 'completed'}
  ])
