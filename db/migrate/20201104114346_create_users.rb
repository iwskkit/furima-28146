class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :mailadress
      t.string :password
      t.string :password_check
      t.string :name
      t.string :name_kana
      t.string :birth
      t.timestamps
    end
  end
end
