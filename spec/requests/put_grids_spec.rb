require 'rails_helper'

describe 'PUT /grids/:id', :type => :request do
    context '(valid request)' do
        it 'returns [success message, status code 200]' do
            grid = Grid.create!(
                solved_grid: "#{'3' * 81}",
                puzzle_grid: "#{'0' * 81}",
                difficulty: 'hard'
            )
            put "/grids/#{grid.id}", params: {
                solved_grid: "#{'2' * 81}",
                puzzle_grid: "#{'1' * 81}",
                difficulty: 'easy'
            }

            expect(JSON.parse(response.body)['message']).to eq 'This Grid has been updated successfully.'
            expect(response).to have_http_status 200
        end
    end
    context '(bad requests)' do
        it 'updating non-existent grid: returns [error message, status code 404]' do
            put '/grids/0', params: {
                solved_grid: "#{'2' * 81}",
                puzzle_grid: "#{'0' * 81}",
                difficulty: 'medium'
            }

            expect(JSON.parse(response.body)['message']).to eq 'Couldn\'t find Grid with \'id\'=0'
            expect(response).to have_http_status 404
        end

        it 'updating with invalid parameters: returns [error message, status code 422]' do
            grid = Grid.create!(
                solved_grid: "#{'8' * 81}",
                puzzle_grid: "#{'9' * 81}",
                difficulty: 'hard'
            )
            put "/grids/#{grid.id}", params: {
                solved_grid: "#{'0' * 40}",
                puzzle_grid: "#{'0' * 40}",
                difficulty: ''
            }

            expect(JSON.parse(response.body)['message']).to eq 'Validation failed: Puzzle grid is the wrong length (should be 81 characters), Solved grid is the wrong length (should be 81 characters), Difficulty can\'t be blank'
            expect(response).to have_http_status 422
        end
    end
end
