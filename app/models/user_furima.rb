class UserFurima
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :user, :item

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :house_number
    validates :building_name
    validates :phone_number, format: { with: denwa }, length: { maximum:11 }
    validates :purchasing_management_id
  end

  def save
    user = User.create()
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, user_id: user.id, item_id: item.id)
    PurchasingManagement.create(user_id: user.id, item_id: item.id)
  end

end
