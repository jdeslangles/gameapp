class TictactoeMovesController < ApplicationController
  #load_and_authorize_resource

  def create
      @game = Game.find params[:game_id]
      begin
        if  @game.is_computer_playing?
          result = @game.record_and_create_new_move params[:case], current_user
        else
          result = @game.record_new_move params[:case], current_user
        end
      rescue GameFinished
        flash[:notice] = "WOOOOOOOOOOONNNNN"
      ensure
        redirect_to game_path params[:game_id]
      end
  end

end

