class Seed
    def self.start(count = 20)
        puts '=== Started Seeding ==='
        Grid.destroy_all
        create_grids(count)
        puts '=== Completed Seeding ==='
    end

    def self.create_grids(count)
        count.times do
            Grid.create!(
                solved_grid: Array.new(81) {rand(1..9).to_s}.join(''),
                puzzle_grid: Array.new(81) {rand(1..9).to_s}.join(''),
                difficulty: ['easy', 'medium', 'hard'].shuffle.first
            )
        end
        puts "Created #{Grid.count} example grids."
    end
end

Seed.start

#these grids are NOT viable boards, and are only meant to be placeholders.
