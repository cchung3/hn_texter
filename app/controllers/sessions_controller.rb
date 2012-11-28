class SessionsController < ApplicationController


  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      cookies[:auth_token] = user.auth_token
      redirect_to user, :notice => "Welcome"
    else
      flash.now.alert = "Incorrect email and/or password"
      render "new"
    end
  end

  def destroy
    cookies[:auth_token] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
end