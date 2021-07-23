class Item < ApplicationRecord
  has_one_attached :image
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
    validates :price, numericality:{in:300..9999999}, format:{ with: /\A[0-9]+\z/ }
  end
  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :prefecture_id
    validates :charge_id
    validates :shipping_date_id
  end

end
