class Grid < ApplicationRecord
    validates :puzzle_grid, presence: true, uniqueness: {case_sensitive: false}, length: {is: 81}
    validates :solved_grid, presence: true, length: {is: 81}
    validates :difficulty, presence: true

    scope :random, -> { offset(rand(Grid.count)).first }
    scope :with_difficulty, -> (difficulty) { where(difficulty: difficulty) }

    def with_arrays
        @puzzle_grid_array = self.make_array(self.puzzle_grid)
        @solved_grid_array = self.make_array(self.solved_grid)
        self
    end
    def puzzle_grid_array
        @puzzle_grid_array
    end
    def solved_grid_array
        @solved_grid_array
    end

    def make_array(str)
        finished_grid = []
        9.times do |i|
            finished_grid << []
            9.times do |j|
                finished_grid[i] << str[i+j]
            end
        end
        finished_grid
    end
end
