class ReviewsController < ApplicationController
    def create
        review = Review.new({
            description: params[:description],
            user_id: current_user.id,
            rating: params[:rating],
            product_id: params[:product_id]
        })
        review.save
        redirect_to "/products/#{params[:product_id]}"
    end


  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def review_params
    params.require(:description, rating)
  end
end
