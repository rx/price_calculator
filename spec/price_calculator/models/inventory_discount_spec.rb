# frozen_string_literal: true

require 'price_calculator'

module PriceCalculator
  module Models
    RSpec.describe InventoryDiscount do
      context 'valid input' do
        let(:discount_rec) { { code: 'beer', quantity: 2, price: BigDecimal('3.0') } }
        it 'has valid attributes' do
          input = InventoryDiscount.new(**discount_rec)
          expect(input.code).to eq('beer')
          expect(input.quantity).to eq(2)
          expect(input.price.to_f).to eq(3.0)
        end
      end
    end
  end
end
