class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :loan, null: false, foreign_key: true
      t.date :payment_date
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps
    end
  end
end
