class Api::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.left_outer_joins(:location).left_outer_joins(:items).left_outer_joins(:tags).select('restaurants.*, locations.restaurant_id, locations.user_id, 
      locations.category, locations.address_1, locations.address_2, locations.address_3, locations.city, locations.state, locations.country, locations.zip, 
      items.id as item_id, items.item_name, items.availability, items.price, items.section, items.img, items.item_description, items.additional_info, tags.id as tag_id, tags.tag')
    render :index
  end

  def show
    @restaurant = Restaurant.left_outer_joins(:location).left_outer_joins(:items).left_outer_joins(:tags).select('restaurants.*, locations.restaurant_id, locations.user_id, 
      locations.category, locations.address_1, locations.address_2, locations.address_3, locations.city, locations.state, locations.country, locations.zip, 
      items.id as item_id, items.item_name, items.availability, items.price, items.section, items.img, items.item_description, items.additional_info, tags.id as tag_id, tags.tag').where(restaurants: {id: params[:id]})
    # render json: {
    #   url: @restaurant.photo1.service_url
    # }
    render 'api/restaurants/show'
  end
end

