class AddGridsTable < ActiveRecord::Migration[5.2]
    def change
        t.string :puzzle_grid
        t.string :solved_grid
        t.string :difficulty

        t.timestamps
    end
end
