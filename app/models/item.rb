class Item < ApplicationRecord
  
  has_one    :buy
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to [ :item_category, :item_condition, :shipping_charge, :shipping_area, :day]
   

  with_options presence: true do
    validates :title
    validates :item_description
   
    with_options numericality: { other_than: 1 } do
      validates :item_category_id
      validates :item_condition_id
      validates :shipping_charge_id
      validates :shipping_area_id
      validates :day_id
    end
    with_options format: {with: /^[0-9]+$/, message: "is invalid. Input half-width characters."} do
      validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9,999,999, message: "is invalid"}
    end
  end
end