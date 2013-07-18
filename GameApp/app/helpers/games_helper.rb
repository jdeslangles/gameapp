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


#   # def find_move(game, move_square)
#   #   move = TictactoeMove.where(game: game, move_square: move_square).first

#   #   if move
#   #     move
#   #   else
#   #     false
#   #   end
#   # end

# # returns player 1 list of moves
#   #
#   def p1_moves(game)
#     p1_moves = Array.new
#     game.tictactoe_moves.each { |n| p1_moves << n.move_square if n.symbol == "X" }
#     return p1_moves
#   end


#   #
#   # returns player 2 list of moves
#   #
#   def p2_moves(game)
#     p2_moves = Array.new
#     game.tictactoe_moves.each { |n| p2_moves << n.move_square if n.symbol == "O" }
#     return p2_moves
#   end


#   #
#   # determines whose move it is
#   #
#   def turn(game)
#     moves_avail = @game.open_tictactoe_move(p1_moves(@game),p2_moves(@game))

#     return "Player 1" if moves_avail.length.odd? && game.users[0].first_to_act == "true"
#     return "Player 2" if moves_avail.length.even? && game.users[0].first_to_act == "true"
#     return "Player 2" if moves_avail.length.odd? && game.users[0].first_to_act == "false"
#     return "Player 1" if moves_avail.length.even? && game.users[0].first_to_act == "false"
#   end


#   #
#   # matches image name with game board symbol and returns that image name
#   # for display purposes
#   #
#   def return_image(game, move_square)
#     return "blank.jpg" if game.tictactoe_moves[move_square].symbol == "" || game.tictactoe_moves[move_square].symbol == nil
#     return "x.jpg" if game.tictactoe_moves[move_square].symbol == "X"
#     return "o.jpg" if game.tictactoe_move[move_square].symbol == "O"
#   end


#   #
#   # called on show page to display results of game
#   #
#   def p_winner(game)
#     return "Player 1" if game.winner?(p1_moves(game))
#     return "Player 2" if game.winner?(p2_moves(game))
#     return "Draw" if game.draw?(p1_moves(game),p2_moves(game))
#   end


#   #
#   # generates computer move symbol.  creates a minimax object and calls create_minimax_tree
#   # on that object.  File for class definition is located at /lib/minimax.rb
#   #
#   def computer_move(game)
#     moves = [p1_moves(game),p2_moves(game)]
#     avail_moves = game.open_tictactoe_moves(p1_moves(game),p2_moves(game))

#     node = Minimax.new moves, avail_moves
#     node.create_minimax_tree(game)
#     return node.select_computer_move.pop
#   end


#   #
#   # sets game stats for users.  Called in games controller update.
#   #
#   def set_win_lose_draw(game, result)
#     if result == "win"
#       game.playings.where(player_position: 1).win += 1
#       game.users[1].lose += 1
#     elsif result == "lose"
#       game.users[0].lose += 1
#       game.users[1].win += 1
#     else
#       game.users[0].draw += 1
#       game.users[1].draw += 1
#     end
#   end


#   #
#   # sets first_to_act symbols.  Called in games controller update.
#   #
#   def set_first_to_act(game)
#     if game.users[0].first_to_act == "true"
#       game.users[0].first_to_act = "false"
#     else
#       game.users[0].first_to_act = "true"
#     end
#   end

#   #
#   # create and initalize game sqaures for gameboard
#   #
#   def create_game_tictactoe_moves(game)
#     9.times { game.tictactoe_moves.build }
#     game.tictactoe_moves.each_with_index { |square, index| square.move_square = index }
#     game.save
#   end

#   #
#   # set win lose draw stats for game users
#   #
#   def set_game_stats(game)
#     set_win_lose_draw(game,"win") if @game.winner?(p1_moves(game))
#     set_win_lose_draw(game,"lose") if @game.winner?(p2_moves(game))
#     set_win_lose_draw(game,"draw") if @game.draw?(p1_moves(game),p2_moves(game))
#     set_first_to_act(game)
#     game.save
#   end

end
