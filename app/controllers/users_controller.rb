class UsersController < ApplicationController
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
        render json:@users, include: ['motorcycle', 'ride_attendances']
    end

    def show
        @user = User.find(params[:id])
        render json:@user, include: ['motorcycle', 'ride_attendances']
    end
end
