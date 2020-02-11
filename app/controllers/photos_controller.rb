class PhotosController < ApplicationController
    def index
        @photos = Photo.all
        render json:@photos
    end

    def show
        @photo = Photo.find(params[:id])
        render json:@photo
    end

    def store
        #upload image to cloudinary
        @value = Cloudinary::Uploader.upload(params[:image])
        #create a new post object and save to db
        @post = Post.new({:link => @value['secure_url'], :caption => params[:caption]})
        @post.save
        #trigger an event with pusher

        redirect_to ('http://localhost:3000/photos')
    end
end
