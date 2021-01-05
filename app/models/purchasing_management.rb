class PurchasingManagement < ApplicationRecord
  attr_accessor :token
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token, presence: true
  end
end
