require 'rails_helper'

describe 'DELETE /grids/:id', :type => :request do
    context '(valid request)' do
        it 'returns [success message, status code 200]' do
            grid = Grid.create!(
                solved_grid: "#{'1' * 81}",
                puzzle_grid: "#{'0' * 81}",
                difficulty: 'easy'
            )
            delete "/grids/#{grid.id}"

            expect(JSON.parse(response.body)['message']).to eq 'This Grid has been successfully destroyed.'
            expect(response).to have_http_status 200
        end
    end

    context '(bad request)' do
        it 'returns [error message, status code 404]' do
            delete '/grids/0'

            expect(JSON.parse(response.body)['message']).to eq 'Couldn\'t find Grid with \'id\'=0'
            expect(response).to have_http_status 404
        end
    end
end
