# frozen_string_literal: true

require 'price_calculator'

module PriceCalculator
  RSpec.describe Receipt do
    let(:path) { File.expand_path('../config', __dir__) }
    let(:inventory_repo) { Repositories::Inventory.new(path: path, discounts_rep: discounts_repo) }
    let(:discounts_repo) { Repositories::Discounts.new(path: path) }

    context 'no discounts' do
      let(:groceries) { %w[milk bread apple] }
      it 'totals correctly' do
        receipt = Receipt.new(groceries, repo: inventory_repo)
        expect(receipt.items.count).to eq(3)
        expect(receipt.discount_applied).to eq(0.0)
        expect(receipt.total_due).to eq(7.03)
      end
    end

    context 'with discounts' do
      let(:groceries) { %w[milk milk bread banana bread bread bread milk apple] }
      it 'totals correctly' do
        receipt = Receipt.new(groceries, repo: inventory_repo)
        expect(receipt.items.count).to eq(4)
        expect(receipt.discount_applied).to eq(3.45)
        expect(receipt.total_due).to eq(19.02)
      end
    end
  end
end
