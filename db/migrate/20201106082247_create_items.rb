class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :image
      t.text :detail
      t.integer :price
      t.timestamps
    end
  end
end
