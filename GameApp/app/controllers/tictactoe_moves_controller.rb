class TictactoeMovesController < ApplicationController

  #load_and_authorize_resource


  def create
      @game = Game.find params[:game_id]
      puts @game.is_computer_playing?
      if  @game.is_computer_playing?
        @game.record_and_create_new_move params, current_user
      else
        @game.record_new_move params, current_user
      end
      redirect_to game_path params[:game_id]
  end


end


#   def index
#     @tictactoe_moves = TictactoeMove.all
#   end


#   def show
#     @tictactoe_move = TictactoeMove.find(params[:id])
#   end


#   def new
#     @tictactoe_move = TictactoeMove.new
#   end


#   def edit
#     @tictactoe_move = TictactoeMove.find(params[:id])
#   end


#   def create
#     @tictactoe_move = TictactoeMove.new(params[:tictactoe_move])
#     @tictactoe_move.save
#     redirect_to @tictactoe_move, notice: 'Tictactoe move was successfully created.'
#   end


#   def update
#     @tictactoe_move = TictactoeMove.find(params[:id])
#     @tictactoe_move.update_attributes(params[:tictactoe_move])
#     redirect_to @tictactoe_move, notice: 'Tictactoe move was successfully updated.'
#   end


#   def destroy
#     @tictactoe_move = TictactoeMove.find(params[:id])
#     @tictactoe_move.destroy
#     redirect_to tictactoe_moves_url
#   end
# end
