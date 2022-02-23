json.set! @star.id do
    json.extract! @star, :id, :user_id, :restaurant_id, :stars, :max_stars
    
end


json.set! "restaurant_name" do
    json.extract! @restaurants, :name
end
