class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    @review = Review.create(review_params)
    @review.user = current_user
    @review.product_id = params["product_id"]
    if @review.save
      redirect_to :back
    else
      redirect_to [:cart]
    end
  end

  def destroy
    @reviewDelete = Review.find params[:id]
    @reviewDelete.destroy
    redirect_to :back, notice: 'Product deleted!'
  end

  private def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end
