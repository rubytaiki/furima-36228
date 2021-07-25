class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :shippingDate

  with_options presence: true do
    validates :image
    validates :item_name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
  end

  
  with_options allow_blank: true do
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format:{ with: /\A[0-9]+\z/ }
  end
  validates :price, presence: true
  

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :prefecture_id
    validates :charge_id
    validates :shippingDate_id
  end

  has_one_attached :image

end
