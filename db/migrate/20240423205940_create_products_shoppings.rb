# frozen_string_literal: true

class CreateProductsShoppings < ActiveRecord::Migration[7.1]
  def change
    create_table :product_shoppings do |t|
      t.belongs_to :product
      t.belongs_to :shopping
      t.float :product_price
      t.integer :product_quantity
      t.timestamps
    end
  end
end
