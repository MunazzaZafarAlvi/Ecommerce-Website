class CartController < ApplicationController
  def show
    @cart_items = current_order.order_items
    @total_amount = @cart_items.sum { |item| item.quantity * item.price }
  end

  def add_to_cart
    product = Product.find(params[:product_id])
    redirect_to cart_path, notice: "Product added to cart!"
  end
end
