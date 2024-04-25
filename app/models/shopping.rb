# frozen_string_literal: true

class Shopping < ApplicationRecord
  has_many :products, through: :product_shoppings, class_name: 'ProductShopping'
  has_many :product_shoppings, dependent: :destroy
end
