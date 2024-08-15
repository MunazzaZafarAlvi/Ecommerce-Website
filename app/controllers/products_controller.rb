class ProductsController < ApplicationController
  def index
    search_params= params[:q] || {}
    @q= Product.ransack(search_params)
    @pagy, @products = pagy(@q.result(distinct: true))
  end

  def show
    @category = params[:category]
    @products = Product.joins(:category).where(categories: { name: @category })

    if @products.empty?
      flash[:notice] = "No products available in this category."
    end
  end
end
