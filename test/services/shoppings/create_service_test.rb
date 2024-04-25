# frozen_string_literal: true

require 'test_helper'

class CreateServiceTest < ActionDispatch::IntegrationTest
  setup do
    Product.create(name: 'imported bottle of perfume', imported: true, product_type: :food)
    @shopping_params = {
      products: [
        name: 'imported bottle of perfume',
        product_price: 10,
        product_quantity: 2
      ]
    }
  end

  test 'call' do
    assert_equal Shoppings::CreateService.new(@shopping_params).call.gsub(/\s+/, ''),
                 '2 imported bottle of perfume : 21.0 Sales Taxes : 1.0 Total: 21.0'.gsub(/\s+/, '')
  end
end
