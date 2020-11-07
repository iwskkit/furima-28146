class CreditCard < ApplicationRecord
  has_one :users
  has_one :items
  belongs_to :adresses
end
