class RidersController < ApplicationController
    def index
        @riders = Rider.all
        render json:@riders, include: :motorcycle
    end

    def show
        @rider = Rider.find(params[:id])
        render json:@rider, include: :motorcycle
    end
end
