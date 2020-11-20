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

        render json:@route, status: :created
    end
    
    
end
