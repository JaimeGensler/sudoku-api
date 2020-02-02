require 'rails_helper'

describe 'GET /grids?difficulty=', :type => :request do
    context '(valid request)' do
        it 'returns [all grids of a difficulty, status code 200]' do
            get '/api/v1/grids?difficulty=easy'

            expect(JSON.parse(response.body).size).to eq 7
            expect(response).to have_http_status 200
        end
    end
    context '(bad request)' do
        it 'returns [error message, status code 400]' do
            get '/api/v1/grids?difficulty=banana'

            expect(JSON.parse(response.body)['message']).to eq 'No such difficulty rating.'
            expect(response).to have_http_status 400
        end
    end
end
