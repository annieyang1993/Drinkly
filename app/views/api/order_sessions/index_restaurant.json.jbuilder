
@order_sessions.each do |os|
    json.set! os.id do
        json.extract! os, :id, :restaurant_id, :first_name, :user_id, :accepted, :accepted_at, :filled, :filled_at, :arrived, :arrived_at, :completed, :completed_at, :subtotal, :taxes, :service_fee, :special_offers, 
            :special_offer_deductions, :credit_card_type, :credit_card_digits, :total, :created_at, :ready_at
        json.set! "orders" do
            json.set! os.order_id do
                json.extract! os, :order_id, :restaurant_id, :item_id, :quantity, :price, :item_name
            end
        end
    end

end