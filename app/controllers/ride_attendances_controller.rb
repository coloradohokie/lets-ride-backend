class RideAttendancesController < ApplicationController
    def index
        @ride_attendances = RideAttendance.all
        render json:@ride_attendances
    end

    def show
        @ride_attendance = RideAttendance.find(params[:id])
        render json:@ride_attendance
    end

    def create
        @ride_attendance = RideAttendance.create(
            ride_id: params[:ride_id],
            user_id: params[:user_id],
        )
        render json:@ride_attendance
    end

    def destroy
        @ride_attendance = RideAttendance.find(params[:id])
        @ride_attendance.destroy
    end
end
