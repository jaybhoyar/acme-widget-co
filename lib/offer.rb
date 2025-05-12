# frozen_string_literal: true

require "bigdecimal"
require_relative "product"

class Offer
  def apply(items)
    # Override in subclass
    items
  end
end

class BuyOneGetOneHalfPrice < Offer
  def apply(items)
    reds = items.select { |item| item.code == 'R01' }
    others = items.reject { |item| item.code == 'R01' }

    discounted = reds.each_slice(2).flat_map do |pair|
      if pair.size == 2
        [
          pair[0],
          Product.new(
            code: pair[1].code,
            name: "#{pair[1].name} (half price)",
            price: (pair[1].price / 2.0).round(4)
          )
        ]
      else
        pair
      end
    end

    others + discounted
  end
end
