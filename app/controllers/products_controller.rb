class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true) # This line should handle the search

    @ladies_products = @products.where(category: 'ladies') # Filter the searched results for ladies
    @gents_products = @products.where(category: 'gents')   # Filter the searched results for gents
  end

  def show
    @category = params[:category]
    @products = Product.joins(:category).where(categories: { name: @category })

    if @products.empty?
      flash[:notice] = "No products available in this category."
    end
  end
end
