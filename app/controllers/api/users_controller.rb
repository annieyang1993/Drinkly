class Api::UsersController < ApplicationController
  def create
    @olduser = User.find_by(username: params[:username])
    @user = User.new(user_params)
    
    if @olduser
       render json: ["Username already exists"], status: 401
    elsif @user.save
      @user.save!
      login(@user)
      render "api/users/show"
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render "api/users/show"
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      render "api/users/show"
    else
      render json: {error: "Could not user"}
    end
  end

  def index
      @user = User.new(user_params)
    @olduser = User.find_by(username: @user.username)
    
    if @olduser
       render json: ["Username already exists"], status: 401
    elsif @user.save
      @user.save!
      login(@user)
      render "api/users/show"
    else
      render json: @user.errors.full_messages, status: 422
    end

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :number, :username, :password, :default_card, :customer_id)
  end
end
