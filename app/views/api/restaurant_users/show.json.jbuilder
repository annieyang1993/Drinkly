json.set! @restaurant_user[0].uid do
    json.extract! @restaurant_user[0], :uid, :restaurant_id, :first_name, :last_name, :name
end


