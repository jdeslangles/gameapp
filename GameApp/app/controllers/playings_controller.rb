class PlayingsController < ApplicationController
  load_and_authorize_resource

  def index
    @playings = Playing.all
  end

  def show
    @playing = Playing.find(params[:id])
  end

  def new
    @playing = Playing.new
  end

  def edit
    @playing = Playing.find(params[:id])
  end

  def create
    @playing = Playing.new(params[:playing])
    @playing.save
    redirect_to @playing, notice: 'Playing was successfully created.'
  end

  def update
    @playing = Playing.find(params[:id])
    @playing.update_attributes(params[:playing])
    redirect_to @playing, notice: 'Playing was successfully updated.'
  end

  def destroy
    @playing = Playing.find(params[:id])
    @playing.destroy
    redirect_to playings_url
  end
end
