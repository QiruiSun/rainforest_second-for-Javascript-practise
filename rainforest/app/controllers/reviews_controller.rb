class ReviewsController < ApplicationController


  before_action :load_product

  def show
    @review = Review.find(params[:id])

  end

  def create
    @review = @product.reviews.build(review_params)
    @review.user = current_user
    # if @review.save
    #   redirect_to product_path(@product)
    # else
    #   flash[:alert] = 'Invalid input for new review!'
    #   render product_path(@product)
    # end

    respond_to do |format|
      if @review.save
        format.html {redirect_to product_path(@product), notice: "Review added."}
        format.js {}
      else
        format.html {render 'products/show', alert: "Invalid input for new review!"}
        format.js {}
      end

    end

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
 def review_params
   params.require(:review).permit(:comment, :product_id)
 end

  def load_product
    @product = Product.find(params[:product_id])
    #code
  end
end
