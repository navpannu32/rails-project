class OrderItemsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @order_item = @order.order_items.build(order_item_params)
    if @order_item.save
      redirect_to @order, notice: 'Order item was successfully added.'
    else
      render 'orders/show'
    end
  end

  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
      redirect_to @order_item.order, notice: 'Order item was successfully updated.'
    else
      render 'orders/show'
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to @order_item.order, notice: 'Order item was successfully removed.'
  end

  private

  def order_item_params
    params.require(:order_item).permit(:product_id, :quantity, :price)
  end
end
