class Star < ApplicationRecord
    belongs_to(
        :restaurant,
        class_name: 'Restaurant',
        optional: true,
        foreign_key: :id,
        primary_key: :restaurant_id,
    )

    belongs_to(
        :user,
        class_name: 'User',
        optional: true,
        foreign_key: :id,
        primary_key: :user_id,
    )

    has_many(
        :restaurantname,
        class_name: 'Restaurant',
        foreign_key: :id,
        primary_key: :restaurant_id
    )

   
end
