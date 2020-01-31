class GridsController < ApplicationController
    def index
        @grids = Grid.all
        json_response(@grids)
    end

    def show
        @grid = Grid.find(params[:id])
        json_response(@grid)
    end

    def create
        @grid = Grid.create!(grid_params)
        json_response(@grid, 201)
    end

    def update
        @grid = Grid.find(params[:id])
        if @grid.update!(grid_params)
            render status: 200, json: {
                message: 'This grid has been updated successfully.'
            }
        end
    end

    def destroy
        @grid = Grid.find(params[:id])
        if @grid.destroy!
            render status: 200, json: {message: 'This grid has been successfully destroyed.'}
        end
    end

    private
    def grid_params
        params.permit(:solved_grid, :puzzle_grid, :difficulty)
    end
end
