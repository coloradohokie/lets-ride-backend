# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rider.destroy_all
Route.destroy_all
Motorcycle.destroy_all
Ride.destroy_all
Photo.destroy_all
RideAttendance.destroy_all

mike = Rider.create(first_name: "Mike", last_name: "Newman")
doug = Rider.create(first_name: "Doug", last_name: "Johnson")

route1 = Route.create(name: "Fun1", description: "Go around the world")
route2 = Route.create(name: "Fun1", description: "Go a different way")

mike_moto1 = Motorcycle.create(make: "Honda", model: "Goldwing", year: "2000", rider_id: mike.id)
mike_moto2 = Motorcycle.create(make: "Harley", model: "Fat Boy", year: "2012", rider_id: mike.id)
doug_moto1 = Motorcycle.create(make: "Harley", model: "Fatty", year: "2017", rider_id: doug.id)

ride1 = Ride.create(date_time: "6/1/2021", description: "Fun ride for everybody")
ride2 = Ride.create(date_time: "7/1/2021", description: "Intense ride")

photo1 = Photo.create(location: "", ride_id: ride1.id)
photo2 = Photo.create(location: "", ride_id: ride1.id)
photo3 = Photo.create(location: "", ride_id: ride1.id)
photo4 = Photo.create(location: "", ride_id: ride1.id)
photo5 = Photo.create(location: "", ride_id: ride1.id)
photo6 = Photo.create(location: "", ride_id: ride2.id)
photo7 = Photo.create(location: "", ride_id: ride2.id)
photo8 = Photo.create(location: "", ride_id: ride2.id)
photo9 = Photo.create(location: "", ride_id: ride2.id)

RideAttendance.create(rider_id: mike.id, ride_id: ride1.id, motorcycle_id: mike_moto1.id)
RideAttendance.create(rider_id: doug.id, ride_id: ride1.id, motorcycle_id: doug_moto1.id)
RideAttendance.create(rider_id: mike.id, ride_id: ride2.id, motorcycle_id: mike_moto2.id)