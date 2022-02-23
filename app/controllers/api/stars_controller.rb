class Api::StarsController < ApplicationController
    def index
        @stars = Star.joins(:restaurantname).select("*").where({user_id: params[:user_id]})
        render :index
    end

    def show
        @star=Star.find_by(user_id: params[:user_id], restaurant_id: params[:restaurant_id])
        @restaurants = @star.restaurantname
        
        render "api/stars/show"
    end

    def update
        @star = Star.find_by(user_id:  params[:user_id], restaurant_id: params[:restaurant_id])
        
        if @star.update(star_params)
        render "api/stars/show"
        else
        render json: @star.errors.full_messages, status: 422
        end
    end

    def create
        @star = Star.new(star_params)
        @oldstar = Star.find_by(user_id: @star.user_id, restaurant_id: @star.restaurant_id)
        
        if @oldstar
        render json: ["Star already exists"], status: 401
        elsif @star.save
        render "api/stars/show"
        else
        render json: @star.errors.full_messages, status: 422
        end
    end 

    def star_params
        params.permit(:user_id, :restaurant_id, :stars, :max_stars)
    end
end
