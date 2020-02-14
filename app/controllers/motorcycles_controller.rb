class MotorcyclesController < ApplicationController
    def index
        @motorcycles = Motorcycle.all
        render json:@motorcycles, include: :ride_attendances
    end

    def show
        @motorcycle = Motorcycle.find(params[:id])
        render json:@motorcycle, include: :ride_attendances
    end

    def create
        @motorcycle = Motorcycle.create(
            make: params[:make],
            model: params[:model],
            year: params[:year],
            image_path: params[:image_path],
            rider_id: params[:rider_id]
        )

        redirect_to "http://localhost:3001/index.html#motorcycles-section"
    end

    def destroy
        @motorcycle = Motorcycle.find(params[:id])
        @motorcycle.destroy
    end
end
