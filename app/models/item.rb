class Item < ApplicationRecord
  has_many :carts
  has_many :users, through: :carts

  attachment :item_image
end
