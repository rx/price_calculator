# frozen_string_literal: true

module PriceCalculator
  # InputSuggestions class
  # Takes an +Array+ of valid inventory items and suggests correct inventory items for invalid items
  class InputSuggestions
    # Takes an +Array+ - inventory_items Valid inventory item codes
    def initialize(inventory_items)
      @inventory_items = inventory_items
    end

    # Takes an +Array+ of item codes to validate against
    # Returns am +Array+ with suggestions
    def suggest(*groceries)
      item_checker = DidYouMean::SpellChecker.new(dictionary: @inventory_items)
      groceries.map do |item|
        item_checker.correct(item)
      end.flatten
    end
  end
end
