class Playing < ActiveRecord::Base

  belongs_to :user
  belongs_to :game

  attr_accessible :finish_position, :game_id, :player_position, :user_id, :win, :lose, :draw

  def self.find_player_position game_id, user_id
    self.where(game_id: game_id, user_id: user_id).first.player_position
  end

end
