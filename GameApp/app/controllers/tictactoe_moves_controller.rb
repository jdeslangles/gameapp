class TictactoeMovesController < ApplicationController
  load_and_authorize_resource

  def index
    @tictactoe_moves = TictactoeMove.all
  end

  def show
    @tictactoe_move = TictactoeMove.find(params[:id])
  end


  def new
    @tictactoe_move = TictactoeMove.new
  end

  def edit
    @tictactoe_move = TictactoeMove.find(params[:id])
  end

  def create
    @tictactoe_move = TictactoeMove.new(params[:tictactoe_move])
    @tictactoe_move.save
    redirect_to @tictactoe_move, notice: 'Tictactoe move was successfully created.'
  end

  def update
    @tictactoe_move = TictactoeMove.find(params[:id])
    @tictactoe_move.update_attributes(params[:tictactoe_move])
    redirect_to @tictactoe_move, notice: 'Tictactoe move was successfully updated.'
  end

  def destroy
    @tictactoe_move = TictactoeMove.find(params[:id])
    @tictactoe_move.destroy
    redirect_to tictactoe_moves_url
  end
end
