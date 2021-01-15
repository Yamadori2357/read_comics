class ReviewsController < ApplicationController
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to comic_path(@review.comic)
    else
      @comic = Comic.find(params[:comic_id])
      render 'comics/show'
    end
  end
    

  private
  
    def review_params
      params.require(:review).permit(:comic_id, :score, :content)
    end
end
