
@order_sessions.each do |os|
    json.set! os.id do
        json.extract! os, :id, :restaurant_id, :user_id, :checked_out, :filled, :item_names, 
            :quantities, :item_cost, :subtotal, :taxes, :service_fee, :special_offers, 
            :special_offer_deductions, :credit_card_type, :credit_card_digits, :total
    end
end
