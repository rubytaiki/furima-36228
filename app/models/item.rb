class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :shipping_date

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :price
  end

  
  with_options allow_blank: true do
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format:{ with: /\A[0-9]+\z/ }
  end
  

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :prefecture_id
    validates :charge_id
    validates :shipping_date_id
  end

  has_one_attached :image

end
