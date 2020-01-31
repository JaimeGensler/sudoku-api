class GridsController < ApplicationController
    def index
        json_response(Grid.all)
    end

    def show
        json_response(Grid.find(params[:id]))
    end

    def random
        json_response(Grid.random)
    end

    def create
        json_response(Grid.create!(grid_params), 201)
    end

    def update
        if Grid.find(params[:id]).update!(grid_params)
            render status: 200, json: {message: 'This Grid has been updated successfully.'}
        end
    end

    def destroy
        if Grid.find(params[:id]).destroy!
            render status: 200, json: {message: 'This Grid has been successfully destroyed.'}
        end
    end

    private
    def grid_params
        params.permit(:solved_grid, :puzzle_grid, :difficulty)
    end
end
