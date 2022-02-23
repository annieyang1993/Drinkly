class Api::OrdersController < ApplicationController

  def create
    @order = Order.new(order_params)
    
    if @order.save
      render "api/orders/show"
    else
      render json: @order.errors.full_messages, status: 422
    end
  end

  def order_params
    params.permit(:restaurant_id, :item_id, :quantity, :user_id, :order_session_id, :price, :item_name)
  end
end
