class UsersController < ApplicationController
  load_and_authorize_resource


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
    redirect_to @user, notice: 'Your avatar was successfully created - play time!'
    else
    render 'new'
  end
  end

  def update
    @user = User.find(params[:id])
     if @user.update_attributes(params[:user])
      redirect_to user_path, notice: 'Your avatar was successfully updated - play time!'
      else
     render action: 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end
