# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

ProductShopping.destroy_all
Product.destroy_all
Shopping.destroy_all

Product.create(
    name: 'book',
    product_type: :book,
    imported: false
)
Product.create(
    name: 'music CD',
    product_type: :other,
    imported: false
)
Product.create(
    name: 'chocolate bar',
    product_type: :food,
    imported: false
)
Product.create(
    name: 'imported box of chocolates',
    product_type: :food,
    imported: true
)

Product.create(
    name: 'imported boxes of chocolates',
    product_type: :food,
    imported: true
)
Product.create(
    name: 'imported bottle of perfume',
    product_type: :other,
    imported: true
)
Product.create(
    name: 'bottle of perfume',
    product_type: :other,
    imported: false
)
Product.create(
    name: 'packet of headache pills',
    product_type: :medical,
    imported: false
)
