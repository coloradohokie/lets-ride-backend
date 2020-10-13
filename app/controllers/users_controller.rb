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
end
