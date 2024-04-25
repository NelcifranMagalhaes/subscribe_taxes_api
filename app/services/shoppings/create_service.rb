# frozen_string_literal: true

module Shoppings
  class CreateService < ApplicationService
    def initialize(shopping_params)
      @products = shopping_params[:products]
      @shopping = nil
    end

    def call
      ActiveRecord::Base.transaction do
        @shopping = Shopping.create
        create_products_shopping
        update_shopping
      end

      output_string
    end

    def create_products_shopping
      @products.each do |product|
        found_product = Product.find_by(name: product[:name])
        ProductShopping.create!(
          product_id: found_product.id,
          shopping_id: @shopping.id,
          product_price: product[:product_price],
          product_quantity: product[:product_quantity]
        )
      end
    end

    def update_shopping
      Shoppings::UpdateService.call(@shopping)
    end

    def output_string
      base_string = ''
      @shopping.product_shoppings.each do |product_shopping|
        product = product_shopping.product
        string_output = "#{product_shopping.product_quantity} #{product.name} : #{
          product_calculation(product, product_shopping)}\n"
        base_string += string_output
      end
      base_string + "Sales Taxes : #{@shopping.total_taxes}\n Total: #{@shopping.total_value}"
    end

    def product_calculation(product, product_shopping)
      Shoppings::Calculation.new(
        product,
        product_shopping.product_price,
        product_shopping.product_quantity
      ).final_product_value.round(2)
    end
  end
end
