class PlacesController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
end

class PlacesController < ApplicationController

  def index
    if session[:user_id]  # If user is logged in
      @places = Place.where(user_id: session[:user_id])  # Show only their places
    else
      @places = []  # No places for logged-out users
    end
  end

  def show
    @place = Place.find_by({ "id" => params["id"], "user_id" => session[:user_id] })

    if @place.nil?  # If the place does not belong to the user or doesn't exist
      redirect_to places_path, alert: "You are not authorized to view this place."
    else
      @entries = Entry.where({ "place_id" => @place["id"] })
    end
  end

  def new
  end

  def create
    @place = Place.new
    @place.name = params[:name]
    @place.user_id = session[:user_id]  # Assign current user
    if @place.save
      redirect_to "/places"
    else
      render :new
    end
  end 

end
