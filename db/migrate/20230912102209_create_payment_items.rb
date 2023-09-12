class CreatePaymentItems < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_items do |t|
      t.references :group, null: false, foreign_key: { to_table: 'groups' }
      t.references :payment, null: false, foreign_key: { to_table: 'payments' }

      t.timestamps
    end
  end
end
