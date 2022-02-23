class Restaurant < ApplicationRecord
  has_one_attached :photo1

  has_many(
    :items,
    class_name: 'Item',
    foreign_key: :restaurant_id,
    primary_key: :id
  )

  has_many(
    :restaurant_users,
    class_name: 'RestaurantUser',
    foreign_key: :restaurant_id,
    primary_key: :id
  )

  has_many(
    :orders,
    class_name: 'Order',
    foreign_key: :restaurant_id,
    primary_key: :id
  )

  has_many(
    :order_items,
    through: :orders,
    source: :item
  )

  has_many(
    :order_sessions,
    class_name: 'OrderSession',
    foreign_key: :restaurant_id,
    primary_key: :id
  )

  has_many(
    :order_session_items,
    through: :order_sessions,
    source: :order_items
  )

  has_many(
    :stars,
    class_name: 'Star',
    foreign_key: :restaurant_id,
    primary_key: :id
  )

  has_many(
    :tags,
    class_name: 'Tag',
    foreign_key: :restaurant_id,
    primary_key: :id
  )

  belongs_to(
    :star,
    class_name: 'Star',
    optional: true,
    foreign_key: :restaurant_id,
    primary_key: :id
  )


  has_many(
    :location,
    class_name: 'Location',
    foreign_key: :restaurant_id,
    primary_key: :id
  )


  

end
