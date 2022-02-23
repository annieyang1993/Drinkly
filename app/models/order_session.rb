class OrderSession < ApplicationRecord
    serialize :special_offers, Array
    serialize :special_offer_deductions, Array

    belongs_to(
        :restaurant,
        class_name: 'Restaurant',
        optional: true,
        foreign_key: :restaurant_id,
        primary_key: :id
    )

    belongs_to(
        :user,
        class_name: 'User',
        optional: true,
        foreign_key: :user_id,
        primary_key: :id
    )

    has_many(
        :orders,
        class_name: 'Order',
        foreign_key: :order_session_id,
        primary_key: :id
    )

    has_many(
        :order_items,
        through: :orders,
        source: :items
    )
end
