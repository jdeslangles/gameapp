module GamesHelper

  def game_player_name(game, player_position)
    game.users[player_position].try(:username)
  end

  def game_player_image(game, player_position)
    game.users[player_position].try(:user_picture)
  end

  def game_player_win?(game, finish_position)
    if game.game_result
      game.users[finish_position].try(:username)
    end
  end

  def is_player_playing game, user
    return false if game.game_finished?
    moves = game.tictactoe_moves
    player_position =  game.playings.where(user_id: user.id).first.player_position
    if moves.empty? and (player_position == 1)
      return true
    elsif moves.empty? and (player_position == 2)
      return false
    end
    player_position= game.playings.where(user_id: user.id).last
    moves.last.player_position != player_position.player_position
  end

  def x_or_o game, square
    move = game.tictactoe_moves.where(move_square: square).first
    puts "move -> #{move}"
    if move
      move.player_position == 1 ? "X" : "O"
    end
  end

end
