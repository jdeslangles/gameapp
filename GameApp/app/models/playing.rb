class Playing < ActiveRecord::Base

  belongs_to :user
  belongs_to :game

  attr_accessible :finish_position, :game_id, :player_position, :user_id
end
