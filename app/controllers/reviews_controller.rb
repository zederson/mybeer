class ReviewsController < ApplicationController

  before_filter :require_authentication

  def create

    review = beer.reviews.find_or_initialize_by_user_id(current_user.id)

    review.update_attributes!(params_review)

    head :ok
  end

  def update
    create
  end

private

  def beer
    @beer ||= Beer.find(params[:beer_id])
  end

  def params_review
    params.require(:review).permit(:beer_id, :point)
  end
end