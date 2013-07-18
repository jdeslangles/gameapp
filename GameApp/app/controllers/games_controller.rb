class GamesController < ApplicationController
  load_and_authorize_resource

  def new
    Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    params[:user_id] ||= 14
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