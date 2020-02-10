class RideAttendancesController < ApplicationController
    def index
        @ride_attendances = RideAttendance.all
        render json:@ride_attendances
    end

    def show
        @ride_attendance = RideAttendance.find(params[:id])
        render json:@ride_attendance
    end
end
