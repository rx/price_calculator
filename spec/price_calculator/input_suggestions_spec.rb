# frozen_string_literal: true

require 'price_calculator/input_suggestions'

module PriceCalculator
  RSpec.describe InputSuggestions do
    context 'valid input' do
      let(:valid_items) { %w[banana bread milk apple] }
      it 'returns no suggestions' do
        input_suggestions = InputSuggestions.new(valid_items)
        expect(input_suggestions.suggest(valid_items)).to eq([])
      end
      it 'returns a suggestion' do
        input_suggestions = InputSuggestions.new(valid_items)
        expect(input_suggestions.suggest('bananna')).to eq(['banana'])
      end
    end
  end
end
