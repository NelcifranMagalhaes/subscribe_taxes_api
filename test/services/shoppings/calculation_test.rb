# frozen_string_literal: true

require 'test_helper'

class CalculationTest < ActionDispatch::IntegrationTest
  setup do
    @shopping = Shopping.create
    @product = Product.create(name: 'imported bottle of perfume', imported: true, product_type: :food)
    ProductShopping.create(product_id: @product.id, shopping_id: @shopping.id, product_price: 10, product_quantity: 2)
  end

  test 'final_product_value' do
    assert_equal Shoppings::Calculation.new(@product, 10, 2).final_product_value, 21
  end

  test 'import_taxes_calculation' do
    assert_equal Shoppings::Calculation.new(@product, 10, 2).import_taxes_calculation, 1
  end

  test 'default_taxes_calculation' do
    assert_equal Shoppings::Calculation.new(@product, 10, 2).default_taxes_calculation, 0
  end

  test 'taxes_value' do
    assert_equal Shoppings::Calculation.new(@product, 10, 2).taxes_value, { total_taxes: 1.0, total_value: 21.0 }
  end
end
