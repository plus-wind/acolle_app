class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :cart_items
end
