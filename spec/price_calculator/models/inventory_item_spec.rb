# frozen_string_literal: true

require 'price_calculator'

module PriceCalculator
  module Models
    RSpec.describe InventoryItem do
      context 'valid input' do
        let(:inventory) { { code: 'beer', name: 'Beer', price: BigDecimal('2.0'), discount: discount } }
        let(:discount) { nil }
        it 'has valid attributes' do
          input = InventoryItem.new(**inventory)
          expect(input.name).to eq('Beer')
          expect(input.code).to eq('beer')
          expect(input.discount).to eq(nil)
        end
      end
    end
  end
end
