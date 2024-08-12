class ProductsController < ApplicationController
  def index
<<<<<<< Updated upstream
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true) # This line should handle the search

    @ladies_products = @products.where(category: 'ladies') # Filter the searched results for ladies
    @gents_products = @products.where(category: 'gents')   # Filter the searched results for gents
=======
    if params[:category].present?
      @products = Product.where(category: params[:category])
    else
      @products = Product.all
    end
>>>>>>> Stashed changes
  end

  def show
    @category = params[:category]
    @products = Product.joins(:category).where(categories: { name: @category })

    if @products.empty?
      flash[:notice] = "No products available in this category."
    end
  end
end
