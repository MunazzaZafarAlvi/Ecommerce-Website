class ProductsController < ApplicationController
  def index
    @products = Product.all
    @ladies_products = Product.where(category: 'ladies') # Adjust the condition as per your schema
    @gents_products = Product.where(category: 'gents')
  end

  def show
    @category = params[:category]
    @products = Product.joins(:category).where(categories: { name: Category.names[@category] })

    if @products.empty?
      flash[:notice] = "No products available in this category."
    end
  end
end
