class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.integer :postal_code
      t.string :prefecture
      t.string :municipality
      t.string :house_number
      t.string :building_name
      t.integer :phone_number
      t.timestamps
    end
  end
end
