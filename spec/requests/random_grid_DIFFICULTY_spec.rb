require 'rails_helper'

describe 'GET /grids/random?difficulty=', :type => :request do
    context '(valid request)' do
        it 'returns [a random grid of specified difficulty, status code 200]' do
            srand(12345)
            get '/grids/random?difficulty=medium'
            grid_one = JSON.parse(response.body)
            get '/grids/random?difficulty=medium'
            grid_two = JSON.parse(response.body)

            expect(grid_one['puzzle_grid']).not_to eq grid_two['puzzle_grid']
            expect(grid_one['difficulty']).to eq 'medium'
            expect(grid_two['difficulty']).to eq 'medium'
            expect(response).to have_http_status 200
        end
    end
    context '(bad request)' do
        it 'returns [error message, status code 400]' do
            get '/grids/random?difficulty=beepbeep'

            expect(JSON.parse(response.body)['message']).to eq 'No such difficulty rating.'
            expect(response).to have_http_status 400
        end
    end
end
