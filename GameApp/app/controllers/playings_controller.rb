class PlayingsController < ApplicationController
  load_and_authorize_resource

  def index
    @playings = Playing.all
  end

  def show
    @playing = Playing.find(params[:id])
  end

end

