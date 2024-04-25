# frozen_string_literal: true

class ProductShopping < ApplicationRecord
  belongs_to :product
  belongs_to :shopping
end
