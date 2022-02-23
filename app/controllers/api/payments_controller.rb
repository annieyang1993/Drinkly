class Api::PaymentsController < ApplicationController
  def create
    @payment = Payment.new(payment_params)
    @oldpayment = Payment.find_by(user_id: params[:user_id], credit_card_digits: params[:credit_card_digits]);
    
    if @oldpayment
       render json: @payment.errors.full_messages, status: 422
    elsif @payment.save
      render "api/payments/show"
    else
      render json: @payment.errors.full_messages, status: 422
    end
  end

  def update
    @payment = Payment.find_by(user_id: params[:user_id], credit_card_digits: params[:credit_card_digits]);
    if @payment.update(payment_params)
      render "api/payments/show"
    else
      render json: {error: "Could not find the info for this credit card and this user."}
    end
  end

  def show
    @payment = Payment.find_by(user_id: params[:id])
    if @payment
      render "api/payments/show"
    else 
      render json: {error: "No payment set-up"}, status: 422
    end
  end

  def find_previous_card
    @payment = Payment.find_by(user_id: params[:id])
  end

  def index
    @payments = User.find(params[:user_id]).payments
    render :index

  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy!
    render json: {error: ""}, status: 422
  end

  private

  def payment_params
    params.permit(:user_id, :customer_id, :payment_id, :credit_card_digits, :exp_date, :card_type)
  end
end
