class Api::LocationsController < ApplicationController
  def show
    @location = Location.find_by(user_id: params[:id])
    if @location==nil 
      render json: ''
    else 
      render 'api/locations/show'
    end
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      render 'api/locations/show'
    else
      render json: @location.errors.full_messages, status:422
    end
  end

  def update
    @location = Location.find_by(user_id: params[:id])

    if @location.update(location_params)
      render 'api/locations/show'
    else 
      render json: @location.errors.full_messages, status: 422
    end
  end

  def location_params
    params.require(:location).permit(:user_id, :address_1, :address_2, :address_3, :city, :state, :country, :latitude, :longitude, :category)
  end

end
