class TictactoeMove < ActiveRecord::Base
  belongs_to :game

  attr_accessible :game_id, :move_square, :player_id, :symbol, :winning_move
end
