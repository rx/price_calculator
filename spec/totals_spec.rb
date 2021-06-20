# frozen_string_literal: true

require 'price_calculator/totals'
require 'yaml'
require 'bigdecimal'

RSpec.describe PriceCalculator::Totals do
  let(:inventory) { YAML.safe_load(File.read(File.join(__dir__, '../config/inventory.yml'))) }
  let(:discounts) { YAML.safe_load(File.read(File.join(__dir__, '../config/discounts.yml'))) }

  context 'no discounts' do
    let(:groceries) { %w[milk bread apple] }
    it 'totals correctly' do
      totals = PriceCalculator::Totals.new(inventory, discounts, *groceries)
      expect(totals.total).to eq(groceries.map { |item| BigDecimal(inventory[item]['price'].to_s) }.sum)
    end
  end

  context 'with discounts' do
    let(:groceries) { %w[milk milk bread banana bread bread bread milk apple] }
    it 'totals correctly' do
      totals = PriceCalculator::Totals.new(inventory, discounts, *groceries)
      expect(totals.total).to eq(0.1902e2)
      expect(totals.discount).to eq(0.345e1)
      expect(totals.items.count).to eq(4)
    end
  end
end
