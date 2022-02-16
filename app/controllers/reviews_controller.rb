class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to @restaurant
    else
      render :new
    end
    # If it saves
      # Redirect To Restaurant Page
    # Otherwise
      # Render the new form again, but with errors
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.review
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
