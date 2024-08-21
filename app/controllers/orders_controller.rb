class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def index
    @orders = Order.all
  end

  def add_to_cart
    @product = Product.find(params[:product_id])
    @current_order = current_order

    if @current_order.nil?
      flash[:alert] = 'Could not create or find an order. Please try again.'
      redirect_to products_path and return
    end

    order_item = @current_order.order_items.find_by(product: @product)
    if order_item
      order_item.quantity += 1
      order_item.save
    else
      @current_order.order_items.create(product: @product, quantity: 1, price: @product.price)
    end

    redirect_to order_path(@current_order), notice: 'Item added to cart.'
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def current_order
    if current_customer
      if session[:order_id]
        Order.find_by(id: session[:order_id]) || create_new_order
      else
        create_new_order
      end
    else
      flash[:alert] = 'You need to sign in before adding items to your cart.'
      redirect_to new_customer_session_path
    end
  end

  def create_new_order
    Rails.logger.info("Attempting to create a new order for customer ID: #{current_customer.id}")
    order = current_customer.orders.new(status: 'pending')
    if order.save
      Rails.logger.info("Order created successfully with ID: #{order.id}")
      session[:order_id] = order.id
      order
    else
      Rails.logger.error("Order could not be created: #{order.errors.full_messages.join(', ')}")
      flash[:alert] = 'Order is not valid. Please try again.'
      redirect_to products_path
      nil
    end
  end
end
