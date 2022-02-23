@items.each do |item|
    json.set! item.id do
        json.extract! item, :id, :item_name, :availability, :restaurant_id, :price, :section, :img, :item_description, :additional_info
    end
end

