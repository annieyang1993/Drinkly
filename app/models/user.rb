class User < ApplicationRecord

  attr_reader :password

  validates :username, :password_digest, :first_name, :last_name, :session_token, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  after_initialize :ensure_session_token

  has_many(
    :orders,
    class_name: 'Order',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :saves,
    class_name: 'Save',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :saved_restaurants,
    through: :saves,
    source: :restaurant
  )
  has_many(
    :order_items,
    through: :orders,
    source: :items
  )

  has_many(
    :order_sessions,
    class_name: 'OrderSession',
    foreign_key: :user_id,
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
    foreign_key: :user_id,
    primary_key: :id
  )

    has_many(
    :location,
    class_name: 'Location',
    foreign_key: :user_id,
    primary_key: :id
  )

    has_many(
      :payments,
      class_name: 'Payment',
      foreign_key: :user_id,
      primary_key: :id
    )

    has_many(
      :locations,
      class_name: 'Location',
      foreign_key: :user_id,
      primary_key: :id
    )



  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    generate_unique_session_token
    save!
    self.session_token
  end

  private

  def ensure_session_token
    generate_unique_session_token unless self.session_token
  end

  def new_session_token
    SecureRandom.urlsafe_base64
  end

  def generate_unique_session_token
    self.session_token = new_session_token
    while User.find_by(session_token: self.session_token)
      self.session_token = new_session_token
    end
    self.session_token
  end

end
