class PhotosController < ApplicationController
    def index
        @photos = Photo.all
        render json:@photos
    end

    def show
        @photo = Photo.find(params[:id])
        render json:@photo
    end

    def create
        photo = Photo.create(
            image_path: params[:image_path],
            ride_id: 1
        )
        
        redirect_to ('http://localhost:3000/photos')
    end
end
