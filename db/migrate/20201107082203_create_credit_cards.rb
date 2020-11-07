class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.integer :credit_number
      t.integer :expiration_year
      t.integer :expiration_month
      t.integer :security_code
      t.timestamps
    end
  end
end
