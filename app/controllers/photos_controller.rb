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
            image_url: params[:imageUrl],
            ride_id: params[:ride_id],
            user_id: params[:user_id]
        )
        
        redirect_to ("http://localhost:3001/ride.html?id=#{photo.ride_id}")
    end
end
