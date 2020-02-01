class GridsController < ApplicationController
    def index
        if params[:difficulty].nil?
            json_response(Grid.all)
        else
            unless ['easy', 'medium', 'hard'].include?(params[:difficulty])
                render status: 400, json: {message: 'No such difficulty rating.'}
            else
                json_response(Grid.with_difficulty(params[:difficulty]))
            end
        end
    end

    def show
        json_response(Grid.find(params[:id]))
    end

    def random
        if params[:difficulty].nil?
            json_response(Grid.random)
        else
            unless ['easy', 'medium', 'hard'].include?(params[:difficulty])
                render status: 400, json: {message: 'No such difficulty rating.'}
            else
                json_response(Grid.with_difficulty(params[:difficulty]).random)
            end
        end
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
