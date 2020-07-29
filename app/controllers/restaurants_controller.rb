class RestaurantsController < ApplicationController
  # GET /restaurants
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save # if the restaurant is valid, restaurant.save returns true
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
