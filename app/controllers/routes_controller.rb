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
        @route = Route.create(
            name: params[:route_name],
            start_location: params[:start_location],
            end_location: params[:end_location],
            description: params[:description],
            map_url: params[:map_url],
            created_by: params[:created_by],
            difficulty: params[:difficulty],
            miles: params[:miles],
            minutes: params[:minutes]
        )

        render json:@route, status: :created
    end

    def update
        @route = Route.find(params[:id])
        @route.name = params[:route_name] if params[:route_name]
        @route.start_location = params[:start_location] if params[:start_location]
        @route.end_location = params[:end_location] if params[:end_location]
        @route.description = params[:description] if params[:description]
        @route.map_url = params[:map_url] if params[:map_url]
        @route.created_by = params[:created_by] if params[:created_by]
        @route.difficulty = params[:difficulty] if params[:difficulty]
        @route.miles = params[:miles] if params[:miles]
        @route.minutes = params[:minutes] if params[:minutes]
        
        if @route.save
            render json:@route, status: :ok
        else
            render json: {result: false, route: @route.errors }, status: :unprocessable_entity
        end
    end
    
    
end
