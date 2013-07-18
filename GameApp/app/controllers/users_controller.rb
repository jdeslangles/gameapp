class UsersController < ApplicationController
  load_and_authorize_resource


  def index
    @users = User.order(:username)
  end


  def show
    @user = User.find(params[:id])
  end

  def my_profile
    @user = current_user
    render :show
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
      UserMailer.registration_confirmation(@user).deliver
      @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_url, notice: "You're now logged In and your avatar was successfully created - play time!"
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
