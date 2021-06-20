# frozen_string_literal: true

require 'price_calculator/input_suggestions'

RSpec.describe PriceCalculator::InputSuggestions do
  context 'valid input' do
    let(:valid_items) { %w[banana bread milk apple] }
    it 'returns no suggestions' do
      input_suggestions = PriceCalculator::InputSuggestions.new(valid_items)
      expect(input_suggestions.suggest(valid_items)).to eq([])
    end
    it 'returns a suggestion' do
      input_suggestions = PriceCalculator::InputSuggestions.new(valid_items)
      expect(input_suggestions.suggest('bananna')).to eq(['banana'])
    end
  end
end
