class Grid < ApplicationRecord
    validates :puzzle_grid, presence: true, uniqueness: true, length: {is: 81}
    validates :solved_grid, presence: true, length: {is: 81}
    validates :difficulty, presence: true
end
