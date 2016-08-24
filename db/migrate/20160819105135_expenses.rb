class Expenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :location
      t.integer :event_id
      t.date :exp_date
      t.decimal :total_amount, precision: 18, scale: 5, default: 0.0
      t.timestamps null: false
    end
  end
end
