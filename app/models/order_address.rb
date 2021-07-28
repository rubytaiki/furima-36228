class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city_word, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city_word
    validates :house_number
    validates :phone_number, format: {with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/ }
  end
  validates :prefecture_id, numericality {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, city_word: city_word, house_number: house_number, phone_number: phone_number, order_id: order_id )
  end


end