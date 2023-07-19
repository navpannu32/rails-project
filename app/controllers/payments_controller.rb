class PaymentsController < ApplicationController
  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to @payment.order, notice: 'Payment was successfully processed.'
    else
      render 'orders/show'
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:order_id, :payment_date, :payment_method, :order_amount)
  end
end
