class AttractionsController < ApplicationController
  before_action :set_attraction, except: [:index, :new, :create]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction), notice: "Attraction was successfully created."
    else
      redirect_to new_attraction_path, alert: "Your attraction could not be created."
    end
  end

  def show
    @ride = Ride.new
  end

  private
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

end