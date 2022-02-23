class Item < ApplicationRecord
    serialize :additional_info
    

    belongs_to(
        :restaurant,
        class_name: 'Restaurant',
        foreign_key: :restaurant_id,
        primary_key: :id
    )

    belongs_to(
        :order,
        class_name: 'Order',
        optional: true,
        foreign_key: :id,
        primary_key: :item_id
    )

    has_many(
        :orders,
        class_name: 'Order',
        foreign_key: :item_id,
        primary_key: :id
    )


    
end
