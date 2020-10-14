def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
end


RideAttendance.destroy_all
Photo.destroy_all
Ride.destroy_all
Route.destroy_all
Motorcycle.destroy_all
User.destroy_all


user1 = User.create(email: 'coloradohokie@gmail.com', password_digest: "#{User.digest('password')}", username: 'Mike', city: 'Denver', state: 'Colorado')
user2 = User.create(email: 'doug@flatiron.com', password_digest: "#{User.digest('password')}", username: 'Doug', city: 'Denver', state: 'Colorado')
user3 = User.create(email: 'ahmed@flatiron.com', password_digest: "#{User.digest('password')}", username: 'Ahmed', city: 'Denver', state: 'Colorado')


route1 = Route.create(name: "Idaho Springs Loop Through Central City", description: "A loop starting and ending in Idaho Springs, through the central Coloado mountains", start_location:"Idaho Springs", end_location:"Idaho Springs", map_path:'<iframe src="https://www.google.com/maps/embed?pb=!1m44!1m12!1m3!1d49066.866420780876!2d-105.50315577697855!3d39.769311637955425!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m29!3e0!4m3!3m2!1d39.7418383!2d-105.51697759999999!4m3!3m2!1d39.7635487!2d-105.5269519!4m3!3m2!1d39.7754908!2d-105.5371481!4m3!3m2!1d39.8003947!2d-105.51238599999999!4m3!3m2!1d39.776237099999996!2d-105.4564285!4m3!3m2!1d39.7536576!2d-105.4021703!4m3!3m2!1d39.741926899999996!2d-105.5162807!5e0!3m2!1sen!2sus!4v1581638393609!5m2!1sen!2sus" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>')
route2 = Route.create(name: "Million Dollar Highway", description: "A ride down the million dollar highway", start_location:"Montrose", end_location:"Durango")

doug_moto1 = Motorcycle.create(make: "Honda", model: "Goldwing", year: "2000", user_id: user2.id)
mike_moto1 = Motorcycle.create(make: "BMW", model: "RS 1200", year: "2017", user_id: user1.id)
mike_moto2 = Motorcycle.create(make: "Kawasaki", model: "Vulcan", year: "2012", user_id: user1.id)
ahmed_moto1 = Motorcycle.create(make: "Moto Guzzi", model: "CR12", year: "1988", user_id: user3.id)

ride1 = Ride.create(title: "Cruisers & Casinos", description: "Fun ride for everybody", date: "2021-06-23", start_time:"8:00 AM", end_time:"2:00 PM", route_id:route1.id, user_id: user1.id)
ride2 = Ride.create(title: "Million Dollar Ride", description: "Let's ride the most beautiful highway in Colorado", date: "2021-07-04", start_time:"8:00 AM", end_time:"2:00 PM", route_id: route2.id, user_id: user1.id)
ride3 = Ride.create(title: "Toy Drive", description: "Bring a toy for the drive", date: "2020-08-12", start_time:"8:00 AM", end_time:"2:00 PM", route_id:route1.id, user_id: user2.id)

photo1 = Photo.create(image_path: "https://www.youmotorcycle.com/wp-content/uploads/Million-Dollar-Highway-Colorado-Motorcycle-Ride.jpg", ride_id: ride1.id, user_id: user1.id)
photo2 = Photo.create(image_path: "https://atime2ride.com/wp-content/uploads/colorado-motorcycle-tours.jpg", ride_id: ride1.id, user_id: user1.id)
photo3 = Photo.create(image_path: "https://www.roadrunner.travel/wp/wp-content/uploads/mWlNB6-LJD60AeqYenIYdsvRie1dc54ewsa2ennTedM.jpg", ride_id: ride1.id, user_id: user1.id)
photo4 = Photo.create(image_path: "https://ridermagazine.com/wp-content/uploads/2018/03/16-Hwy149.jpg", ride_id: ride1.id, user_id: user1.id)
photo5 = Photo.create(image_path: "https://learnandserve.org/wp-content/uploads/9ffa672ce74606907833f5da75d472e7-colorado-adventure-1.jpg", ride_id: ride1.id, user_id: user2.id)
photo6 = Photo.create(image_path: "https://www.colorado.com/sites/default/files/styles/media-player-large/public/Motorcycle1_NearLakeCity_PR_Colorado%20Mountain%20Moto.jpg?itok=yl3tZo93", ride_id: ride2.id, user_id: user2.id)
photo7 = Photo.create(image_path: "https://www.youmotorcycle.com/wp-content/uploads/Million-Dollar-Highway-Colorado-Motorcycle-Ride.jpg", ride_id: ride2.id, user_id: user3.id)
photo8 = Photo.create(image_path: "https://secure.meetupstatic.com/photos/member/e/9/0/3/highres_277619651.jpeg", ride_id: ride2.id, user_id: user3.id)
photo9 = Photo.create(image_path: "https://www.blochchapleau.com/wp-content/uploads/2011/10/colorado-motorcycle-accident-lawyer.jpg", ride_id: ride2.id, user_id: user3.id)

RideAttendance.create(user_id: user1.id, ride_id: ride1.id)
RideAttendance.create(user_id: user2.id, ride_id: ride1.id)

RideAttendance.create(user_id: user1.id, ride_id: ride2.id)
RideAttendance.create(user_id: user3.id, ride_id: ride2.id)

RideAttendance.create(user_id: user2.id, ride_id: ride3.id)
RideAttendance.create(user_id: user1.id, ride_id: ride3.id)
RideAttendance.create(user_id: user3.id, ride_id: ride3.id)