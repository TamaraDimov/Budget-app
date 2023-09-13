class AddAmountToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :amount, :decimal
  end
end
