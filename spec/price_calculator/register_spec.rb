# frozen_string_literal: true

require 'price_calculator'

module PriceCalculator
  RSpec.describe Register do
    let(:path) { File.expand_path('../config', __dir__) }
    let(:inventory_repo) { Repositories::Inventory.new(path: path, discounts_rep: discounts_repo) }
    let(:discounts_repo) { Repositories::Discounts.new(path: path) }

    context 'empty' do
      let(:groceries) { [] }
      it 'is valid' do
        result = Register.new(repo: inventory_repo).scan(*groceries)
        expect(result.valid?).to eq(true)
      end
    end

    context 'invalid' do
      let(:groceries) { %w[breed] }
      it 'is valid' do
        result = Register.new(repo: inventory_repo).scan(*groceries)
        expect(result.valid?).to eq(false)
      end
    end

    context 'valid' do
      let(:groceries) { %w[milk milk bread banana bread bread bread milk apple] }
      it 'is valid' do
        result = Register.new.scan(*groceries)
        expect(result.valid?).to eq(true)
        expect(result.data.items.count).to eq(4)
        expect(result.data.discount_applied).to eq(3.45)
        expect(result.data.total_due).to eq(19.02)
      end
    end
  end
end
