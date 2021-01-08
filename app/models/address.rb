class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purchasing_management
  belongs_to_active_hash :prefecture

end
