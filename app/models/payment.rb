class Payment < ApplicationRecord
  
  belongs_to(
    :user,
    class_name: 'User',
    optional: true,
    foreign_key: :id,
    primary_key: :user_id
  )

end
