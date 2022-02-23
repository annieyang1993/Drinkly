class Api::SavesController < ApplicationController
  def create
    # puts save_params
    @oldsave = Save.find_by(user_id: params[:user_id], restaurant_id: params[:restaurant_id]);

    @save = Save.new(user_id: params[:user_id], restaurant_id: params[:restaurant_id])
    
    if @oldsave
       render json: @save.errors.full_messages, status: 422
    elsif @save.save
      @saves = User.find(params[:user_id]).saves
      render :index
    else
      render json: @save.errors.full_messages, status: 422
    end
  end

  def show
    @save = Save.find_by(user_id: params[:user_id], restaurant_id: params[:restaurant_id]);
    if @save
      render "api/saves/show"
    else 
      render json: @save.errors.full_messages, status: 422
    end
  end


  def index
    @saves = User.find(params[:user_id]).saves
    render :index
  end

  def destroy
    @save = Save.find_by(user_id: params[:user_id], restaurant_id: params[:restaurant_id]);
    @save.destroy!
    @saves = User.find(params[:user_id]).saves
    render :index
  end

  private

  def save_params
    params.require(:saves).permit(:restaurant_id, :user_id)
  end
end
