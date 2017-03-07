class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :stock_count
      t.integer :catalog_id
      t.timestamps null: false
    end
  end
end
