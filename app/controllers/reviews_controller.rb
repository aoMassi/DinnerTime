class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.event = Event.find(params[:event_id])
    if @review.save!
      redirect_to review_path(@review)
    else
      render "event/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :event)
  end
end
