class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email]) 

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id  # Log in user
      redirect_to places_path, notice: "You are logged in successfully!"
    else
      flash[:alert] = "Invalid email or password. Please try again."
      render :new  # Stay on login page, don’t redirect
    end
  end

  def destroy
    session[:user_id] = nil  # Log out user
    redirect_to login_path, notice: "You are logged out successfully!"
  end
end