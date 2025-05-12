# frozen_string_literal: true

require 'rspec'
require_relative '../lib/basket'
require_relative '../lib/product'
require_relative '../lib/offer'
require_relative '../lib/delivery_rule'

RSpec.describe Basket do
  let(:products) do
    [
      Product.new(code: 'R01', name: 'Red Widget', price: 32.95),
      Product.new(code: 'G01', name: 'Green Widget', price: 24.95),
      Product.new(code: 'B01', name: 'Blue Widget', price: 7.95)
    ]
  end
  let(:offers) { [BuyOneGetOneHalfPrice.new] }
  let(:delivery) { DeliveryRule.new }

  subject { described_class.new(products: products, delivery_rule: delivery, offers: offers) }

  it "calculates total for B01, G01" do
    subject.add('B01')
    subject.add('G01')
    expect(subject.total).to eq('$37.85')
  end

  it "calculates total for R01, R01" do
    subject.add('R01')
    subject.add('R01')
    expect(subject.total).to eq('$54.37')
  end

  it "calculates total for R01, G01" do
    subject.add('R01')
    subject.add('G01')
    expect(subject.total).to eq('$60.85')
  end

  it "calculates total for B01, B01, R01, R01, R01" do
    subject.add('B01')
    subject.add('B01')
    subject.add('R01')
    subject.add('R01')
    subject.add('R01')
    expect(subject.total).to eq('$98.27')
  end
end
