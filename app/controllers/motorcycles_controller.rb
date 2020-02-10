class MotorcyclesController < ApplicationController
    def index
        @motorcycles = Motorcycle.all
        render json:@motorcycles
    end

    def show
        @motorcycle = Motorcycle.find(params[:id])
        render json:@motorcycle
    end
end
