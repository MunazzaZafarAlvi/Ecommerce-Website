class PaymentsController < ApplicationController
  before_action :set_order

  def new
    @payment = @order.payment || @order.build_payment
  end

  def create
    @payment = @order.build_payment(payment_params)

    if @payment.save
      # Redirect or perform any other action on successful save
      redirect_to root_path, notice: 'Payment was successfully processed.'
    else
      # Render the form again with errors
      render :new
    end
  end

  private
  def set_order
    @order = Order.find(params[:order_id])
  end

  def payment_params
    params.require(:payment).permit(:name, :details, :payment_type)
  end
end
