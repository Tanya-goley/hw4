class EntriesController < ApplicationController
  before_action :require_login  #Ensures only logged-in users can create posts
  before_action :set_place, only: [:new, :create]  

  def new
    @entry = Entry.new
  end

  def create
    @entry = @place.entries.new(entry_params)  
    if @entry.save
      redirect_to place_path(@place), notice: "Post created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_place
    @place = Place.find(params[:place_id])  # Find correct place for the post
  end

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :image)  # Allows image uploads
  end
end
