class GamesController < ApplicationController
  load_and_authorize_resource


  def new
    Game.new
  end


  def show
    @game = Game.find(params[:id])
  end


  def create
    @game = Game.create_for_players current_user.id, params[:user_id]
    render :show
  end

  def edit
    @game = Game.find(params[:id])
  end


  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_url
  end
end








































#   def index
#     @games = Game.all
#   end


#   def show
#     @game = Game.find(params[:id])
#   end


#   def new
#     @game = Game.create_for_players(game_player1, game_player2)
#   end


#   def edit
#     @game = Game.find(params[:id])
#   end


#   def create
#     @game = Game.new(params[:game])
#     @game.save
#     redirect_to @game, notice: 'Game was successfully created.'
#   end


#   def update
#     @game = Game.find(params[:id])
#     @game.update_attributes(params[:game])
#     redirect_to @game, notice: 'Game was successfully updated.'
#   end

#   def destroy
#     @game = Game.find(params[:id])
#     @game.destroy
#     redirect_to games_url
#   end


# end





















































#   include GamesHelper


#   def new
#     @game = Game.new
#   end


#   def create
#     @game = Game.new
#     create_game_tictactoe_moves(@game)
#     redirect_to @game ###
#   end


#   def update
#     @game = Game.find(params[:id])

#     if @game.update_attributes(params[:game])
#       if @game.winner?(p1_moves(@game)) || @game.winner?(p2_moves(@game)) || @game.draw?(p1_moves(@game),p2_moves(@game))
#         set_game_stats(@game)
#         redirect_to game_path(@game)
#       else
#         redirect_to edit_game_path(@game)
#       end
#     else
#       flash[:error] = 'Invalid player name. Name must not be blank.'
#       redirect_to new_user_path(@game)
#     end
#   end


#   def edit
#     @game = Game.find(params[:id])
#   end


#   def show
#     @game = Game.find(params[:id])
#   end


#   def destroy
#     @game = Game.find(params[:id])
#     @game.destroy
#     redirect_to games_url
#   end

# end











  # def move
  #   @game = Game.find params[:id]
  #   move = Move.create game_id: game.id, move_square: params[:move_square]
  #   # check winning move
  #   if winning_move
  #     win = Game.create score: 2000, game_type: blah
  #   else
  #     redirect_to @game
  #   end
  # end


