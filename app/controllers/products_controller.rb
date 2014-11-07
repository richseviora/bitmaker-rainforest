class ProductsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(post_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to products_path
    else
      redirect_to product_path(@product)
    end
  end

  def create
    @product = Product.create(post_params)
    if @product
      redirect_to products_path
    else
      render :new
    end
  end

  private
  def handle_not_found
    flash[:error] = "Product ID #{params[:id]} could not be found"
    redirect_to products_path
  end

  def post_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end
end
