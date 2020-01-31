require 'rails_helper'

describe 'GET /grids/random', :type => :request do
    it 'returns [a random grid, status code 200]' do
        srand(12345)
        #it's technically possible for this to fail if the same grid is randomly picked twice
        get '/grids/random'
        grid_one = JSON.parse(response.body)['solved_grid']
        get '/grids/random'
        grid_two = JSON.parse(response.body)['solved_grid']

        expect(grid_one).not_to eq grid_two
        expect(response).to have_http_status 200
    end
end
