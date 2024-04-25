# frozen_string_literal: true

class ShoppingsController < ApplicationController
  # POST /shoppings
  def create
    @shopping = Shoppings::CreateService.new(shopping_params).call

    render json: @shopping, status: :created
  rescue StandardError => e
    render json: e, status: :unprocessable_entity
  end

  private

  # Only allow a list of trusted parameters through.
  def shopping_params
    params.require(:shopping).permit(products: %i[name product_price product_quantity])
  end
end
