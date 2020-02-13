class RidesController < ApplicationController
    def index
        @rides = Ride.all
        render json:@rides, include: ['route', 'riders']
    end

    def show
        @ride = Ride.find(params[:id])
        render json:@ride, include: ['route', 'riders']
    end

    def create
        ride = Ride.create(
            date_time: params[:date],
            description: params[:description],
            route_id: params[:route]
        )

        redirect_to ('http://localhost:3001/index.html')
    end
end
