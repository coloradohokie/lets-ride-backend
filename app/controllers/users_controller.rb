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

    # Be sure to set up the route before turning this on.
    # def index
    #     @users = User.all
    #     render json: {users: @users}, status: :ok
    # end

    def show
        @user = User.find(params[:id])
        motorcycles = Motorcycle.find_by(user_id: @user.id)
        ride_attendances = RideAttendance.select{|x| x.user_id == @user.id}
        rides = ride_attendances.map{|ride| Ride.find(ride.ride_id)}
        rides = rides.map {|ride| {id:ride.id, date:ride.date, title:ride.title}}
        render json:{user: @user, motorcycles: motorcycles, ride_attendances: rides}, status: :ok
    end
end
