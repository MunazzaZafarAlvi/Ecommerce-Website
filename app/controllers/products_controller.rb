class ProductsController < ApplicationController
  def index
    if params[:category].present?
      @products = Product.where(category: params[:category])
    else
      @products = Product.all
    end
  end

  def show
    @category = params[:category]
    @products = Product.joins(:category).where(categories: { name: @category })

    if @products.empty?
      flash[:notice] = "No products available in this category."
    end
  end
end
