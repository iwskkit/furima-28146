class User < ApplicationRecord
  has_many :items
  has_one :adresses
  has_one :credit_cards
end
