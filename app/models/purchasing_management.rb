class PurchasingManagement < ApplicationRecord
  with_options presence: true do
    validates :user_id
    validates :item_id
  end
end
