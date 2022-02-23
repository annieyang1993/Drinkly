

class Api::ChargesController < ApplicationController

    def create
        Stripe.api_key = "sk_test_51JZinFLzDwIJCChhYxbOCZa7nRavX2k6kd11VKKHmgArctNNavgQzKoYaUX4a40DjYq6hZzPBU8V1mWmklUJIHm100Tjif6QvL"
        if params[:customer_id]
            @intent = Stripe::SetupIntent.create({
            customer: params[:customer_id] })
            c = params[:customer_id]
        else
            customer = Stripe::Customer.create
            @intent = Stripe::SetupIntent.create({
            customer: customer['id'] })
            c = customer['id']
        end

        # payment_intent = Stripe::PaymentIntent.create(
        #     amount: 1999,
        #     currency: 'usd',
        #     customer: customer['id'],
        #     setup_future_usage: 'off_session'

        # )

        render json: {clientSecret: @intent.client_secret, customer_id: c}
    end

    def create_payment_intent
        Stripe.api_key = "sk_test_51JZinFLzDwIJCChhYxbOCZa7nRavX2k6kd11VKKHmgArctNNavgQzKoYaUX4a40DjYq6hZzPBU8V1mWmklUJIHm100Tjif6QvL"
        begin
        intent = Stripe::PaymentIntent.create({
            amount: params[:amount],
            currency: 'cad',
            customer: params[:customer_id],
            payment_method: params[:payment_id],
            confirm: true,
        })
        rescue Stripe::CardError => e
        # Error code will be authentication_required if authentication is needed
        puts "Error is: \#{e.error.code}"
        payment_intent_id = e.error.payment_intent.id
        payment_intent = Stripe::PaymentIntent.retrieve(payment_intent_id)
        puts payment_intent.id
        end
    end


end
