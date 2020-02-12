class RidesController < ApplicationController
    def index
        @rides = Ride.all
        render json:@rides, include: ['route', 'riders']
    end

    def show
        @ride = Ride.find(params[:id])
        render json:@ride, include: ['route', 'riders']
    end
end
