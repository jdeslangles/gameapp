class CreateTictactoeMoves < ActiveRecord::Migration
  def change
    create_table :tictactoe_moves do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :move_square
      t.string :symbol
      t.string :winning_move

      t.timestamps
    end
  end
end
