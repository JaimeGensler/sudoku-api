class Grid < ApplicationRecord
    validates :puzzle_grid, presence: true, uniqueness: {case_sensitive: false}, length: {is: 81}
    validates :solved_grid, presence: true, length: {is: 81}
    validates :difficulty, presence: true

    scope :random, -> { offset(rand(Grid.count)).first }
    scope :with_difficulty, -> (difficulty) { where(difficulty: difficulty) }
end
