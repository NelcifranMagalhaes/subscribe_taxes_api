# frozen_string_literal: true

require 'test_helper'

class UpdateServiceTest < ActionDispatch::IntegrationTest
  setup do
    @shopping = Shopping.create
    @product = Product.create(name: 'imported bottle of perfume', imported: true, product_type: :food)
    ProductShopping.create(product_id: @product.id, shopping_id: @shopping.id, product_price: 10, product_quantity: 2)
  end

  test 'call' do
    assert_equal Shoppings::UpdateService.new(@shopping).call.total_taxes, 1
    assert_equal Shoppings::UpdateService.new(@shopping).call.total_value, 21
  end
end
