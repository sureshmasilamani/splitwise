class CreateSettlements < ActiveRecord::Migration
  def change
    create_table :settlements do |t|
      t.integer :expense_id
      t.integer :payee_id
      t.integer :payer_id
      t.decimal :settlement_amt, precision: 18, scale: 5, default: 0.0
      t.timestamps null: false
    end
  end
end
