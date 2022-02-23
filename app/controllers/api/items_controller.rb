class Api::ItemsController < ApplicationController
  def index
    @items = Restaurant.find(params[:restaurant_id]).items
    render :index
  end

  def show
    @item = Item.find(params[:id])
    render :show
  end
end

