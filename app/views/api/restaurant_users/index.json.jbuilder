
@restaurant_users.each do |ru|
    json.set! ru.uid do
        json.extract! ru, :uid, :name, :restaurant_id, :first_name, :last_name
    end
end
