class Order < ApplicationRecord
    
    belongs_to(
        :restaurant,
        class_name: 'Restaurant',
        optional: true,
        foreign_key: :restaurant_id,
        primary_key: :id,
    )

    belongs_to(
        :user,
   
        class_name: 'User',
        optional: true,
        foreign_key: :user_id,
        primary_key: :id,
        
    )

    belongs_to(
        :item,
        class_name: 'Item',
        optional: true,
        foreign_key: :item_id,
        primary_key: :id,
    )

    has_many(
        :items,
        class_name: 'Item',
        foreign_key: :id,
        primary_key: :item_id
    )

    belongs_to(
        :order_sessions,
        class_name: 'OrderSession',
        optional: true,
        foreign_key: :id,
        primary_key: :order_session_id
    )
   
end
