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
        end
        it '.with_difficulty should return grid(s) with a certain difficulty' do
            set = Grid.with_difficulty('easy')
            expect(set.size).to eq 7
            expect(Grid.with_difficulty('hard').random).not_to eq Grid.with_difficulty('hard').random
        end
    end
end
