# frozen_string_literal: true

require "bigdecimal"

class Basket
  def initialize(products:, delivery_rule:, offers: [])
    @products = products.map { |product| [product.code, product] }.to_h
    @delivery_rule = delivery_rule
    @offers = offers
    @items = []
  end

  def add(product_code)
    product = @products[product_code]
    raise "Unknown product: #{product_code}" unless product
    @items << product
  end

  def total
    discounted_items = @offers.reduce(@items) do |items, offer|
      offer.apply(items)
    end

    subtotal = discounted_items.sum { |item| BigDecimal(item.price.to_s) }.round(4)
    delivery = BigDecimal(@delivery_rule.calculate(subtotal).to_s).round(4)

    total_amount = subtotal + delivery

    # Format the total amount to 2 decimal places
    "$#{truncate(total_amount, 2).to_f}"
  end

  def empty?
    @items.empty?
  end

  private

  # Helper method to truncate a BigDecimal to a specified number of decimal places
  def truncate(value, decimals)
    # This will truncate to the desired number of decimals
    value.truncate(decimals).to_f
  end
end

