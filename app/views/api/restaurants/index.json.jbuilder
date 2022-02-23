
@restaurants.each do |restaurant|
    json.set! restaurant.id do
        json.extract! restaurant, :id, :name, :email, :phone, :latitude, :longitude, :price_level, :description, :img1, :img2, :address_1, :address_2, :address_3, :city, :state, :country, :zip, :pricing, :rating, :number_of_ratings, :ready_in, :operating_time
        json.set! "items" do
            json.set! restaurant.item_id do
                json.extract! restaurant, :item_id, :item_name, :availability, :price, :section, :img, :item_description, :additional_info
            
            end
        end
        json.set! "tags" do
            json.set! restaurant.tag_id do
                json.extract! restaurant, :tag_id, :tag
            
            end
        end
    end
    
    
end

