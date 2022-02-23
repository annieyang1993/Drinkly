class Tag < ApplicationRecord
        belongs_to(
        :restaurant,
        class_name: 'Restaurant',
        optional: true,
        foreign_key: :id,
        primary_key: :restaurant_id,
    )

   
end
