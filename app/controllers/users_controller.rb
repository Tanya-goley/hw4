class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id  # Automatically log in user
      redirect_to places_path, notice: "Account created successfully!"
    else
      flash[:alert] = "Signup failed. Please check your details."
      render :new
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
