# frozen_string_literal: true

require_relative 'response'

module PriceCalculator
  # InputValidator class
  # Takes an array of valid inventory items and validates supplied groceries against the valid inventory
  class InputValidator
    # new
    # @param [Array] valid_items Valid inventory items as lowercase strings
    def initialize(inventory_items)
      @inventory_items = inventory_items
    end

    # @param [Array] groceries The groceries to validate against as lowercase strings
    # @return [Response] The validation results
    def validate(*groceries)
      invalid_items = groceries - @inventory_items
      Response.new(data: groceries - invalid_items,
                   errors: invalid_items)
    end
  end
end
