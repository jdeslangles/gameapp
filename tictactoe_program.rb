class Game < ActiveRecord::Base

  has_many :playings
  has_many :users, through: :playings

  has_many :tictactoe_moves

  attr_accessible :game_result, :game_type_id


  def self.create_for_players(game_player1, game_player2)
    g=Game.create
    [game_player1, game_player2].shuffle.each_with_index do |game_player, index|
      Playing.create user_id: game_player.id, game_id: game.id, player_position: (index + 1)
    end
    @current_game=g.id
  end

  def load_game
    @current_game=(params[:id])
  end


  def moves_made_array
    a = [nil,nil,nil,nil,nil,nil,nil,nil]
    all_moves = TictactoeMove.where(game_id:@current_game)
    all_moves.each do |move|
      a[move.move_square] = move.symbol
    end
    return a
  end


  def make_move
    if game_finished?
      game_over
    else
      which_players_turn
      game_moves
      if @current_moves.include?(move_square)
        #return to move path with error message "That move is not valid"
      else
        player_symbol
        TictactoeMove.create game_id:@current_game, player_id:@current_player, move_square:move_square, symbol:@symbol
      end
    end
  end


  def game_moves
    @current_moves = TictactoeMove.where(game_id:@current_game.id).map {|x|x.move_square}
  end


  def player_symbol
    if @current_player == 1
      @symbol="X"
    else
      @symbol="O"
  end
end


  def which_players_turn
    game_moves
     if @current_moves.empty?
      @current_player = 1
    else
     @last_player=TictactoeMove.where(game_id:@current_game).map {|p|p.player_id}.last
      if @last_player == 1
        @current_player = 2
      else
        @current_player = 1
      end
    end
  end


  def game_finished?
    winning_game? || moves_made_array.all?
  end


  def winning_game?
    winning_lines.detect do |winning_line|
      line_scores = winning_line.map{|e|moves_made_array[e]}
      line_scores.any? && line_scores.uniq.size == 1
    end
  end


  def winning_lines
    [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  end


  def game_over
    if winning_game?
      #Update Game table with result
      which_players_turn
      @last_player
      g = Game.find_by_id(@current_game)
      g.game_result = "Win"

      #Update Playing table for each user with result
      winner = Playing.where(player_position:@last_player, game_id:@current_game)
      winner.finish_position = 1

      loser = Playing.where(player_position:@current_player, game_id:@current_game)
      loser.finish_position = 2

    else
      #Update Game table with draw
      g = Game.find_by_id(@current_game)
      g.game_result = "Draw"
      draw1 = Playing.where(player_position:@last_player, game_id:@current_game)
      draw1.player_position = 0
      draw2 = Playing.where(player_position:@current_player, game_id:@current_game)
      draw2.player_position = 0
    end
  end

end
