class Adress < ApplicationRecord
  has_one :users
  has_many :credit_cards
  has_one :items
end
