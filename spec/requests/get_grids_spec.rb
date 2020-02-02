require 'rails_helper'

describe 'GET /grids', :type => :request do
    it 'returns [all grids, status code 200]' do
        get '/api/v1/grids'

        expect(JSON.parse(response.body).size).to eq 20
        expect(response).to have_http_status 200
    end
end
