
json.set! @restaurant[0].id do
    json.extract! @restaurant[0], :name, :email, :phone, :latitude, :longitude, :price_level, :description, :img1, :img2, :address_1, :address_2, :address_3, :city, :state, :country, :zip, :pricing, :rating, :number_of_ratings, :ready_in, :operating_time
end

@restaurant.each do |item| 
    json.set! item.item_name do
        json.extract! item, :item_name, :availability, :price, :section, :description, :additional_info
    end
end

json.set! "tag" do 
    @restaurant.each do |tag| 
        json.set! tag.tag do
            json.extract! tag, :tag_id, :tag
        end
    end
end

