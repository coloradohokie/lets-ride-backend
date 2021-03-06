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
            rider = {
                id:rider.id, 
                username: rider.username, 
                avatar_url: rider.avatar_url,
                ride_att_id: ride_att.id
            }
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

        render json:{ride: ride, route: route, organizer: organizer}, status: :created
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
        route = Route.find(ride.route_id)
        organizer = User.find(ride.user_id)
        organizer = {id: organizer.id, username: organizer.username}

        render json:{ride: ride, route: route, organizer: organizer}, status: :ok
    end

    def destroy
        @ride = Ride.find(params[:id])
        @ride.destroy

        render status: :no_content
    end

end
