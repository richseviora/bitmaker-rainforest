class ReviewsController < ApplicationController
  before_filter :load_product
  before_filter :ensure_logged_in, only: [:create, :destroy]

  def show
    @review = Review.find(params[:id])

  end

  def create
    # This action assumes that the JS responses are being invoked from the context of the products/show view.
    @review = @product.reviews.build(review_params)
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to products_path, notice: 'Review created successfully.' }
        format.js
      else
        format.html { render 'products/show' }
        format.js # Logic inside create.js.erb will determine what action is taken. If there are errors, it will display them.
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def load_product
    @product = Product.find(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:comment, :product_id)
  end
end
