class Game < ActiveRecord::Base

  has_many :playings
  has_many :users, through: :playings

  has_many :tictactoe_moves
  attr_accessible :game_result, :game_type_id
end
