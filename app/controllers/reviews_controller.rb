class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # POST /restaurants/:restaurant_id/reviews => { "restaurant_id" => 42}
  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save # never unconditionally save!
      # HAPPY PATH
      redirect_to restaurant_path(@restaurant)
      # triggers a new request, loses all state
    else
      # SAD PATH
      render 'new' # leaves us in the create action
                   # display new view on top of it
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
