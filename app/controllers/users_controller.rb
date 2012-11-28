class UsersController < ApplicationController
  # 
  # # before_filter :ensure_current_user, :except => [:new, :create]
  # 
  # def index
  #   @users = User.all
  # end
  # 

  def show
    @user = User.find(params[:id])
    must_be_logged_in(@user)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    must_be_logged_in(@user)
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      cookies[:auth_token] = @user.auth_token
      redirect_to @user, notice: 'You have registered.'
    else
      render action: "new"
    end
  end

  def update
    @user = User.find(params[:id])
    must_be_logged_in(@user)
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    must_be_logged_in(@user)
    @user.destroy
    redirect_to root_path, notice: "Destroyed account"
  end

end