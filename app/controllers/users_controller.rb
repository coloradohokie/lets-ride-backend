class UsersController < ApplicationController
    
    skip_before_action :authenticate, only: [:create]

    def create
        @user = User.create({
            email: params[:email],
            password: params[:password],
            username: params[:username],
            city: params[:city],
            state: params[:state]
        })
        render json: {user: @user}, status: :created
    end

    def index
        @users = User.all
        render json:@users, include: ['motorcycles', 'ride_attendances']
    end

    def show
        @user = User.find(params[:id])
        render json:@user, include: ['motorcycles', 'ride_attendances']
    end
end
