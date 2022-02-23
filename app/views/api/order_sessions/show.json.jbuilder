json.set! @order_session.id do
    json.extract! @order_session, :id, :restaurant_id, :user_id, :accepted, :accepted_at, :filled, :filled_at, :arrived, :arrived_at, :completed, :completed_at, :subtotal, :taxes, :service_fee, :special_offers, 
      :special_offer_deductions, :credit_card_type, :credit_card_digits, :total, :created_at, :ready_at
end


