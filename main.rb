# frozen_string_literal: true

require_relative 'lib/basket'
require_relative 'lib/delivery_rule'
require_relative 'lib/offer'
require_relative 'lib/product'

def available_products
  [
    Product.new(code: 'R01', name: 'Red Widget', price: 32.95),
    Product.new(code: 'G01', name: 'Green Widget', price: 24.95),
    Product.new(code: 'B01', name: 'Blue Widget', price: 7.95)
  ]
end

def display_welcome(products)
  puts "Welcome to Acme Widget Co!"
  puts "=" * 40
  puts "Available Products:"
  products.each do |product|
    puts "#{product.code}: #{product.name} - $#{'%.2f' % product.price}"
  end
end

def prompt_product_codes
  print "Enter product codes separated by commas: "
  gets.strip.split(',').map(&:strip).reject(&:empty?)
end

def validate_codes(codes, products)
  valid_codes = products.map(&:code)
  codes.reject { |code| valid_codes.include?(code) }
end

def run_checkout
  products = available_products
  offers = [BuyOneGetOneHalfPrice.new]
  delivery = DeliveryRule.new
  basket = Basket.new(products: products, delivery_rule: delivery, offers: offers)

  display_welcome(products)
  codes = prompt_product_codes

  if codes.empty?
    puts "\nNo products added to basket."
    return
  end

  invalid_codes = validate_codes(codes, products)
  if invalid_codes.any?
    puts "Invalid product codes: #{invalid_codes.join(', ')}"
    return
  end

  codes.each { |code| basket.add(code) }
  puts "\nFinal Total: #{basket.total}"
end

run_checkout
