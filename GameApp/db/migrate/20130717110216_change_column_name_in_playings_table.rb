class ChangeColumnNameInPlayingsTable < ActiveRecord::Migration
  def change
    rename_column :tictactoe_moves, :player_id, :player_position
  end
end