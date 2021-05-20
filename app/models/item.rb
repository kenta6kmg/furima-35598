class Item < ApplicationRecord
  has_one    :buy
  belongs_to :user
end
