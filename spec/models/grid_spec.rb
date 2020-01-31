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
    end
end
