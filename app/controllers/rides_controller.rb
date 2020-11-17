class RidesController < ApplicationController
    def index
        @rides = Ride.all
        render json:@rides, only: [:id, :title, :date, :user_id]
    end

    def show
        @ride = Ride.find(params[:id])
        organizer = User.find(@ride.user_id)
        organizer = {id: organizer.id, username: organizer.username}
        @route = Route.find(@ride.route_id)
        ride_attendance = RideAttendance.select { |ride_att| ride_att.ride_id == @ride.id}
        @riders = ride_attendance.map { |ride_att|
            rider = User.find(ride_att.user_id)
            rider = {id:rider.id, username: rider.username, ride_att_id: ride_att.id}
        }
        render json:{ride: @ride, riders: @riders, route: @route, organizer: organizer} 
    end

    def create
        ride = Ride.create(
            title: params[:title],
            description: params[:description],
            date: params[:date],
            start_time: params[:start_time],
            end_time: params[:end_time],
            user_id: params[:user_id],
            route_id: params[:route_id]
        )
        route = Route.find(ride.route_id)
        organizer = User.find(ride.user_id)
        organizer = {id: organizer.id, username: organizer.username}

        # redirect_to ('http://localhost:3001/index.html')
        render json:{ride, route, organizer}, status: :created
    end

    def update
        ride = Ride.find(params[:id])
        ride.update(
            title: params[:title],
            description: params[:description],
            date: params[:date],
            start_time: params[:start_time],
            end_time: params[:end_time],
            user_id: params[:user_id],
            route_id: params[:route_id]
        )

        redirect_to("http://localhost:3001/ride.html?id=#{ride.id}")
    end
end
