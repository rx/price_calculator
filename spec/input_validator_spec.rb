# frozen_string_literal: true

require 'price_calculator/input_validator'

RSpec.describe PriceCalculator::InputValidator do
  context 'valid input' do
    let(:valid_items) { %w[banana bread milk apple] }
    it 'returns valid items' do
      input_validator = PriceCalculator::InputValidator.new(valid_items)
      response = input_validator.validate(*valid_items)
      expect(response.valid?).to eq(true)
      expect(response.data).to eq(valid_items)
    end
  end
  context 'invalid input' do
    let(:valid_items) { %w[banana bread milk apple] }
    let(:invalid_item) { 'bannana' }
    it 'returns false' do
      input_validator = PriceCalculator::InputValidator.new(valid_items)
      response = input_validator.validate(invalid_item)
      expect(response.valid?).to eq(false)
      expect(response.data).to eq([])
      expect(response.errors).to eq([invalid_item])
    end
  end
end
