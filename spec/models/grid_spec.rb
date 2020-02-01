require 'rails_helper'

describe Grid do
    context '(validations)' do
        it { should validate_presence_of :solved_grid }
        it { should validate_presence_of :puzzle_grid }
        it { should validate_presence_of :difficulty }

        it { should validate_uniqueness_of(:puzzle_grid).case_insensitive }

        it { should validate_length_of(:puzzle_grid).is_equal_to 81 }
        it { should validate_length_of(:solved_grid).is_equal_to 81 }
    end

    context '(scopes)' do
        it '.random should return a random grid' do
            srand(12345)
            expect(Grid.random).to be_an_instance_of Grid
            expect(Grid.random.solved_grid).not_to eq(Grid.random.solved_grid)
            #it's technically possible for this test to fail if it randomly pics the same grid twice in a row, but this is unlikely with a large enough database
        end
        it '.all_by_difficulty should return all grids of a certain difficulty' do
            set = Grid.all_by_difficulty('easy')
            expect(set.size).to eq 7
        end
        it '.random should return random grids of a certain difficulty' do
            srand(12345)
            grid_one = Grid.random_by_difficulty('hard')
            grid_two = Grid.random_by_difficulty('hard')
            expect(grid_one).not_to eq grid_two
            expect(grid_one['difficulty']).to eq 'hard'
            expect(grid_two['difficulty']).to eq 'hard'
        end
    end
end
