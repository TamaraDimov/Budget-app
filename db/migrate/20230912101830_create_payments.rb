class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :name
      t.references :author, null: false, foreign_key: { to_table: 'users' }
      t.references :group, foreign_key: true, null: false
      t.timestamps
    end
  end
end
