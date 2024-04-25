# frozen_string_literal: true

module Shoppings
  class UpdateService < ApplicationService
    def initialize(shopping)
      @shopping = shopping
      @total_value = 0
      @total_taxes = 0
    end

    def call
      ActiveRecord::Base.transaction do
        update_taxes
      end

      @shopping
    end

    def update_taxes
      @shopping.product_shoppings.each do |product_shopping|
        taxes_hash = Shoppings::Calculation.new(
          product_shopping.product,
          product_shopping.product_price,
          product_shopping.product_quantity
        ).taxes_value
        @total_value += taxes_hash[:total_value]
        @total_taxes += taxes_hash[:total_taxes]
      end

      @shopping.update(
        total_taxes: @total_taxes.round(2),
        total_value: @total_value.round(2)
      )
    end
  end
end
