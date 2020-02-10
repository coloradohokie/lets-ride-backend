class RidesController < ApplicationController
    def index
        @rides = Ride.all
        render json:@rides
    end

    def show
        @ride = Ride.find(params[:id])
        render json:@ride
    end
end
