# frozen_string_literal: true

class DeliveryRule
  def calculate(subtotal)
    if subtotal >= 90
      0
    elsif subtotal >= 50
      2.95
    else
      4.95
    end
  end
end
