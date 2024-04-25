# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :shoppings, through: :product_shoppings, class_name: 'ProductShopping'
  has_many :product_shoppings, dependent: :destroy
  enum product_type: { book: 'book', food: 'food', medical: 'medical', other: 'other' }
end
