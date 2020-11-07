class Item < ApplicationRecord
  belongs_to :users
  has_one :credit_cards
  has_one :adresses
end
