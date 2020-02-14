class RidersController < ApplicationController
    def index
        @riders = Rider.all
        render json:@riders, include: ['motorcycle', 'ride_attendances']
    end

    def show
        @rider = Rider.find(params[:id])
        render json:@rider, include: ['motorcycle', 'ride_attendances']
    end
end
