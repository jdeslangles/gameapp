module GamesHelper


def game_player_name(game, player_position)
  game.users[player_position].try(:username)
end



  def is_player_playing game, user
    moves = game.tictactoe_moves
    return true if moves.empty?
    player_position= game.playings.where(user_id: user.id).last
    puts player_position
    moves.last.player_position != player_position.player_position
  end


  def x_or_o game, square
    move = game.tictactoe_moves.where(move_square: square).first
    if move
      move.player_position == 1 ? "X" : "O"
    end
  end

end
