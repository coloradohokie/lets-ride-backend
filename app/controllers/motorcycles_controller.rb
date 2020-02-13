class MotorcyclesController < ApplicationController
    def index
        @motorcycles = Motorcycle.all
        render json:@motorcycles
    end

    def show
        @motorcycle = Motorcycle.find(params[:id])
        render json:@motorcycle
    end

    def create
        @motorcycle = Motorcycle.create(
            make: params[:make],
            model: params[:model],
            year: params[:year],
            image_path: params[:image_path],
            rider_id: params[:rider_id]
        )

        redirect_to "http://localhost:3001/index.html"
    end
end
