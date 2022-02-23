class Api::OrderSessionsController < ApplicationController
  def index
    if params[:restaurant_id]==nil
      @order_sessions = OrderSession.joins(:restaurant).joins(:user).joins(:orders).select('order_sessions.*, order_sessions.created_at, restaurants.name, orders.id as order_id, orders.restaurant_id, orders.item_id, orders.quantity, orders.price, orders.item_name').where(users: {id: params[:user_id]})
      render :index
    elsif params[:user_id]==nil
      @order_sessions = OrderSession.joins(:restaurant).joins(:user).joins(:orders).select('order_sessions.*, order_sessions.created_at, users.first_name, orders.id as order_id, orders.restaurant_id, orders.item_id, orders.quantity, orders.price, orders.item_name').where(restaurants: {id: params[:restaurant_id]})
      render :index_restaurant
    end
  end

  def show
      @order_sessions = OrderSession.joins(:restaurant).joins(:user).joins(:orders).select('order_sessions.*, order_sessions.created_at, users.first_name, orders.id as order_id, orders.restaurant_id, orders.item_id, orders.quantity, orders.price, orders.item_name').where(restaurants: {id: params[:id]})
      render :index_restaurant
  end

  # def show
  #   @item = Item.find(params[:id])
  #   render :show
  # end

  def update
        @order_session = OrderSession.find(params[:id])
        
        if @order_session.update(order_params)
        render "api/order_sessions/show"
        else
        render json: @order_session.errors.full_messages, status: 422
        end
    end

  def create 
    @order_session = OrderSession.new(order_params)
    # order_params[:item_names].each do |ele, i|
    #   p ele
    #   @order_session.item_names << ele
    #   @order_session.quantities << order_params[:quantities][i]
    #   @order_session.item_cost << order_params[:item_cost][i]
    # end

    if @order_session.save
      ActionCable.server.broadcast('order:532', {id: @order_session.id, 
        restaurant_id: @order_session.restaurant_id,
        user_id: @order_session.user_id,
        accepted: @order_session.accepted,
        filled: @order_session.filled,
        subtotal: @order_session.subtotal,
        taxes: @order_session.taxes,
        service_fee: @order_session.service_fee,
        special_offers: @order_session.special_offers,
        special_offer_deductions: @order_session.special_offer_deductions,
        credit_card_type: @order_session.credit_card_type,
        credit_card_digits: @order_session.credit_card_digits,
        total: @order_session.total,
        ready_in: @order_session.ready_at})
      render "api/order_sessions/show"
    else
      render json: @order_session.errors.full_messages, status: 422
    end
  end 

  def new_orders
      Time.zone="Eastern Time (US & Canada)"
      @order_sessions = OrderSession.joins(:restaurant).joins(:user).joins(:orders).select('order_sessions.*, order_sessions.created_at, users.first_name, orders.id as order_id, orders.restaurant_id, orders.item_id, orders.quantity, orders.price, orders.item_name').where(restaurants: {id: params[:restaurant_id]}).where(order_sessions: {accepted: false}).where(order_sessions: {created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day})
      render :index_restaurant
  end
  def accepted_orders
      Time.zone="Eastern Time (US & Canada)"
      @order_sessions = OrderSession.joins(:restaurant).joins(:user).joins(:orders).select('order_sessions.*, order_sessions.created_at, users.first_name, orders.id as order_id, orders.restaurant_id, orders.item_id, orders.quantity, orders.price, orders.item_name').where(restaurants: {id: params[:restaurant_id]}).where(order_sessions: {accepted: true, completed: false}).where(order_sessions: {created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day})
      render :index_restaurant
  end

  def completed_orders
      Time.zone="Eastern Time (US & Canada)"
      @order_sessions = OrderSession.joins(:restaurant).joins(:user).joins(:orders).select('order_sessions.*, order_sessions.created_at, users.first_name, orders.id as order_id, orders.restaurant_id, orders.item_id, orders.quantity, orders.price, orders.item_name').where(restaurants: {id: params[:restaurant_id]}).where(order_sessions: {completed: true}).where(order_sessions: {created_at: (Time.zone.now.beginning_of_day)..Time.zone.now.end_of_day})
      p Time.zone.now.beginning_of_day
      p Time.zone.now.end_of_day
      render :index_restaurant
  end

  def order_history
      @order_sessions = OrderSession.joins(:restaurant).joins(:user).joins(:orders).select('order_sessions.*, order_sessions.created_at, users.first_name, orders.id as order_id, orders.restaurant_id, orders.item_id, orders.quantity, orders.price, orders.item_name').where(restaurants: {id: params[:restaurant_id]}).where(order_sessions: {created_at: params[:beginning_date]..Time.zone.now.end_of_day})
      render :index_restaurant
  end


  def order_params
    params.permit(:restaurant_id, :user_id, :accepted, :accepted_at, :filled, :filled_at, :arrived, :arrived_at, :completed, :completed_at, :subtotal, :taxes, :service_fee, :special_offers, 
      :special_offer_deductions, :credit_card_type, :credit_card_digits, :total, :ready_at)
  end
end
