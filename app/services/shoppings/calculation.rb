# frozen_string_literal: true

module Shoppings
  class Calculation < ApplicationService
    IMPORTED_TAX = 0.05
    DEFAULT_TAX = 0.10
    def initialize(product, value, quantity)
      @product = product
      @value = value
      @quantity = quantity
    end

    def final_product_value
      ((@quantity * @value) + import_taxes_calculation + default_taxes_calculation)
    end

    def import_taxes_calculation
      @product.imported ? @quantity * (@value * IMPORTED_TAX) : 0
    end

    def default_taxes_calculation
      @product.product_type == 'other' ? @quantity * (@value * DEFAULT_TAX) : 0
    end

    def taxes_value
      { total_taxes: (import_taxes_calculation + default_taxes_calculation),
        total_value: final_product_value }
    end
  end
end
