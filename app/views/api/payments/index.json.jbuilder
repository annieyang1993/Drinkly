
@payments.each do |payment|
    json.set! payment.id do
        json.extract! payment, :id, :user_id, :customer_id, :payment_id, :credit_card_digits, :exp_date, :card_type
    end
end
