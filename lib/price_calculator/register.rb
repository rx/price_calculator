# frozen_string_literal: true

require_relative 'input_validator'
require_relative 'receipt'
require_relative 'repositories/inventory'

module PriceCalculator
  # Top level interface for scanning groceries and producing a receipt
  class Register
    def initialize(repo: Repositories::Inventory.new,
                   input_validator: InputValidator.new(repo.valid_codes))
      @repo = repo
      @input_validator = input_validator
    end

    # Takes an +Array+ of grocery codes as strings or symbols
    #
    # On success returns data as +Receipt+ object
    #
    # On failure returns error contains an +Array+ of error messages:
    #
    # Returns a +Response+ object
    def scan(*grocery_codes)
      response = @input_validator.validate(*grocery_codes)
      response = Response.new(data: Receipt.new(grocery_codes, repo: @repo)) if response.valid?
      response
    end
  end
end
