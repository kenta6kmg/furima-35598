class Item < ApplicationRecord
  
  has_one    :buy
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to [ :item_category, :item_condition, :shipping_charge, :shipping_area, :day]
  

end