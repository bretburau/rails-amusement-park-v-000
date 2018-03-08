class AttractionsController < ApplicationController
  before_action :current_user
  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    end
  end
  
  def index
    @user = current_user
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def ride
    get_attraction
    @user = User.find(session[:user_id])
    ride = Ride.new(user_id: session[:user_id], attraction_id: params[:id])
    if ride.take_ride == true
      flash[:message] = "Thanks for riding the #{@attraction.name}!"
    else
      flash[:message] = ride.take_ride
    end
    redirect_to user_path(@user)
  end

  def edit
    get_attraction
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end

  def get_attraction
    @attraction = Attraction.find(params[:id])
  end
  
end
