class ApplicationController < ActionController::Base
  include Pagy::Backend
  helper_method :current_order

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

  private
    def create_new_order
      order = current_customer.orders.new(status: 'Pending')
      if order.save
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
