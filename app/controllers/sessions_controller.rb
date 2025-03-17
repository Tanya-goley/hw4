class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])  # Find user by email
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id  # Log in user
      redirect_to places_path, notice: "You are logged in successfully!"
    else
      flash[:alert] = "Invalid email or password!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil  # Log out user
    redirect_to login_path, notice: "You are logged out successfully!"
  end
end
