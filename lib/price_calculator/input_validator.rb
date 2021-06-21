# frozen_string_literal: true

require_relative 'response'

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
                   errors: invalid_items)
    end
  end
end
