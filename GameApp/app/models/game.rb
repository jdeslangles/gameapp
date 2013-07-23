class GameFinished < StandardError; end

class Game < ActiveRecord::Base
  WINNING_LINES = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  has_many :playings
  has_many :users, through: :playings
  has_many :tictactoe_moves

  attr_accessible :game_result, :game_type_id

def self.create_for_players(game_player1_id, game_player2_id)
    g=Game.create
    Playing.create user_id: game_player1_id, game_id: g.id, player_position: 1
    Playing.create user_id: game_player2_id, game_id: g.id, player_position: 2
    @current_game=g.id
    g
  end

  def get_player player_position
    playings.where(player_position: player_position).first.user
  end

  def load_game
    @current_game=(params[:id])
  end

  def is_computer_playing?
    values = self.playings.select{ |playing| playing.user_id == User.computer_id }
    !values.empty?
  end

  def record_new_move square_case, user
    player_position = playings.where(user_id: user.id).first.player_position
    tictactoe = tictactoe_moves.create(player_position: player_position, move_square: square_case)
    if game_finished?
      game_over
      true
    end
    false
  end

  def record_and_create_new_move square_case, user
    record_new_move square_case, user
    move = computer_move_valid
    if move
      computer_user = User.find User.computer_id
      record_new_move move, computer_user
    else
      true
    end
  end

  def moves_made_array
    a = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    tictactoe_moves.each do |move|
      a[move.move_square] = (move.player_position == 1 ? "X" : "O")
    end
    a
  end

  def computer_move; (1..8).to_a.sample; end

  def computer_move_valid
    ((0..8).to_a - tictactoe_moves.map{ |m| m.move_square}).sample
  end

  def make_move
    unless game_finished?
      which_players_turn
      # game_moves
      if @current_moves.include?(move_square)
      else
        player_symbol
        TictactoeMove.create game_id:@current_game, player_id:@current_player, move_square:move_square, symbol:@symbol
      end
    end
  end

  def player_symbol
      if @current_player == 1
        @symbol="X"
      else
        @symbol="O"
    end
  end

  def which_players_turn
    if tictactoe_moves.map {|x|x.move_square}.empty?
      1
    else
      tictactoe_moves.last.player_position == 1 ? 2 : 1
    end
  end

  def game_finished?
    winning_game? || moves_made_array.all?
  end

  def winning_game?
    WINNING_LINES.detect do |winning_line|
      line_scores = winning_line.map{|e|moves_made_array[e]}
      line_scores.any? && line_scores.uniq.size == 1
    end
  end

  def game_over
    if winning_game?
      last_player = which_players_turn
      self.update_attribute :game_result,  "Win"

      #Update playings table for each user with result
      winner = self.playings.where(player_position:last_player).first
      winner.update_attribute(:finish_position, 1)
      winner.save
      loser = self.playings.select{ |playing| playing.user_id!=winner.user_id}.first
      loser.update_attribute(:finish_position, 2)
      loser.save
      raise GameFinished
    else
      #Update Game table with draw
      self.game_result = "Draw"
      self.playings.each do |playing|
        playing.update_attribute(:finish_position, 0)
      end
      raise GameFinished
    end
  end

end
