class RoutesController < ApplicationController
    def index
        @routes = Route.all
        render json:@routes
    end

    def show
        @route = Route.find(params[:id])
        render json:@route
    end

    def create
        route = Route.create(
            name: params[:route_name],
            start_location: params[:start_location],
            end_location: params[:end_location],
            description: params[:description],
            map_path: params[:map_path]
        )

        redirect_to ('http://localhost:3001/organize-ride.html')
    end
    
    
end
