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
end
