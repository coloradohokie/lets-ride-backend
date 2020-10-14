class RidesController < ApplicationController
    def index
        @rides = Ride.all
        render json:@rides, include: ['route', 'ride_attendances', 'users']
    end

    def show
        @ride = Ride.find(params[:id])
        render json:@ride, include: ['route', 'ride_attendances', 'users']
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

        redirect_to ('http://localhost:3001/index.html')
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
