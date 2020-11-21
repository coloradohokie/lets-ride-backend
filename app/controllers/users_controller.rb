class UsersController < ApplicationController
    
    skip_before_action :authenticate, only: [:create]

    # def create
    #     @user = User.create({
    #         email: params[:email],
    #         password: params[:password],
    #         username: params[:username],
    #         city: params[:city],
    #         state: params[:state],
    #         avatar: params[:avatar]
    #     })
    #     render json: {user: @user}, status: :created
    # end

    def create
        @user = User.new(user_params)
            if @user.save
                render json: {user: @user}, status: :created
            else
                render json: {result: false, user: @user.errors }, status: :unprocessable_entity
            end
    end

    # Be sure to set up the route before turning this on.
    def index
        @users = User.all
        render json: {users: @users}, status: :ok
    end

    # def update
    #     @user = User.find(params[:id])
    #     @user.update(
    #         email: params[:email],
    #         username: params[:username],
    #         password: params[:password],
    #         city: params[:city],
    #         state: params[:state],
    #         avatar: params[:avatar]
    #     )
    #     render json:@user, status: :ok
    # end

    def update
        @user = User.find(params[:id])
        
        @user.email = params[:email] if params[:email]
        @user.username = params[:username] if params[:username]
        @user.password = params[:password] if params[:password]
        @user.city = params[:city] if params[:city]
        @user.state = params[:state] if params[:state]
        @user.avatar = params[:avatar] if params[:avatar]

        if @user.save
            render json:@user, status: :ok
        else
            render json: {result: false, user: @user.errors }, status: :unprocessable_entity
        end
    end


    def show
        @user = User.find(params[:id])
        motorcycles = Motorcycle.select{|bike| bike.user_id == @user.id}
        ride_attendances = RideAttendance.select{|x| x.user_id == @user.id}
        rides = ride_attendances.map{|ride| Ride.find(ride.ride_id)}
        rides = rides.map {|ride| {id:ride.id, date:ride.date, title:ride.title, cover_image_url: ride.cover_image_url}}
        render json:{user: @user, motorcycles: motorcycles, ride_attendances: rides}, status: :ok
    end

    private
    def user_params
        params.permit(:email, :password, :username, :city, :state, :avatar)
    end
end
