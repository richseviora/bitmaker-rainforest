class ProductsController < ApplicationController
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
    @product.update_attributes(post_params)
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

  end

  private

  def post_params

  end
end
