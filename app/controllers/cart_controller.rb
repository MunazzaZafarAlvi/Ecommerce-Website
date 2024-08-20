class CartController < ApplicationController
  def show
    @cart_items = current_order.order_items
    @total_amount = @cart_items.sum { |item| item.quantity * item.price }
  end
end
