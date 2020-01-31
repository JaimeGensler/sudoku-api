class Grid
    validates :puzzle_grid, presence: true, uniqueness: true, length: 81
    validates :solved_grid, presence: true, length: 81
    validates :difficulty, presence: true
end
