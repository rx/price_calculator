# frozen_string_literal: true

module PriceCalculator
  # InputSuggestions class
  # Takes an array of valid inventory items and suggests correct inventory items for invalid items
  class InputSuggestions
    # new
    # @param [Array] inventory_items Valid inventory items
    def initialize(inventory_items)
      @inventory_items = inventory_items
    end

    # @param [String] groceries The groceries to validate against
    # @return [ValidationResults] The validation results
    def suggest(*groceries)
      item_checker = DidYouMean::SpellChecker.new(dictionary: @inventory_items)
      groceries.map do |item|
        item_checker.correct(item)
      end.flatten
    end
  end
end
