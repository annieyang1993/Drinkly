
@stars.each do |ele|
    json.set! ele.id do
        json.extract! ele, :id, :user_id, :restaurant_id, :stars, :max_stars, :name, :img1
    end
    
end




