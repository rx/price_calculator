# frozen_string_literal: true

require 'price_calculator'

module PriceCalculator
  RSpec.describe ReceiptItem do
    context 'no discounts' do
      let(:path) { File.expand_path('../../config', __dir__) }
      let(:item_repo) { Repositories::Inventory.new(path: path) }
      it 'totals correctly' do
        receipt = ReceiptItem.new(2, item_repo.find_by_code('milk'))
        expect(receipt.name).to eq('Milk')
        expect(receipt.code).to eq('milk')
        expect(receipt.discounted_price.to_f).to eq(5.0)
        expect(receipt.full_price.to_f).to eq(7.94)
      end
    end
  end
end
