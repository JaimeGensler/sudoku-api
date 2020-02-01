require 'rails_helper'

describe 'POST /grids', :type => :request do
    context '(valid request)' do
        it 'returns [success message, status code 201]' do
            post '/grids', params: {
                solved_grid: "#{'2' * 81}",
                puzzle_grid: "#{'0' * 81}",
                difficulty: 'medium'
            }

            expect(JSON.parse(response.body)['id']).to be_an_instance_of(Integer)
            expect(response).to have_http_status 201
        end
    end

    context '(bad request)' do
        it 'returns [error message, status code 422]' do
            post '/grids', params: {
                solved_grid: "0123456789",
                puzzle_grid: "0105105010",
                difficulty: 'medium'
            }

            expect(JSON.parse(response.body)['message']).to eq 'Validation failed: Puzzle grid is the wrong length (should be 81 characters), Solved grid is the wrong length (should be 81 characters)'
            expect(response).to have_http_status 422
        end
    end
end
