class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :state
      t.decimal :bill_amount
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
