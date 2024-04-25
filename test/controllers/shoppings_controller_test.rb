# frozen_string_literal: true

require 'test_helper'

class ShoppingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    Product.create(name: 'imported bottle of perfume', imported: true, product_type: :food)
  end

  test 'should create shopping' do
    post shoppings_url,
         params: { shopping: { products: [{
           name: 'imported bottle of perfume',
           product_price: 27.99,
           product_quantity: 1
         }] } }, as: :json

    assert_response :created
    assert_match '1 imported bottle of perfume : 29.39 Sales Taxes : 1.4 Total: 29.39'.gsub(/\s+/, ''),
                 response.body.gsub(/\s+/, '')
  end
  test 'should create with wrong params' do
    post shoppings_url,
         params: { shopping: { products: [{
           name: 'imported bottle of water',
           product_price: 27.99,
           product_quantity: 1
         }] } }, as: :json

    assert_response :unprocessable_entity
    assert_match "undefined method `id' for nil",
                 response.body
  end
end
