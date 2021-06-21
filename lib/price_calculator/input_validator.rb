# frozen_string_literal: true

require_relative 'response'
require_relative 'input_suggestions'

module PriceCalculator
  # Takes an +Array+ of valid inventory items and validates supplied groceries against the valid inventory
  class InputValidator
    # +Array+ inventory_items - inventory codes (lowercase strings)
    def initialize(inventory_items)
      @inventory_items = inventory_items
    end

    #  +Array+ of grocery item codes
    #
    #  Return +Response+ object with the validation results
    def validate(*groceries)
      invalid_items = groceries - @inventory_items
      Response.new(data: groceries - invalid_items,
                   errors: build_error_messages(invalid_items))
    end

    def build_error_messages(invalid_items)
      suggestor = PriceCalculator::InputSuggestions.new(@inventory_items)
      invalid_items.map do |unrecognized_item|
        suggestions = suggestor.suggest(unrecognized_item)
        "Unrecognized item #{unrecognized_item}. #{suggestions.any? ? "did you mean '#{suggestions.join('or')}'?" : nil}"
      end
    end
  end
end
