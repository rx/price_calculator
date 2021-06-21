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
    # Returns a +Response+ object
    # On success data as +Receipt+
    # On failure error contains an +Array+ of +Hash+ with the code and message:
    #
    # Example error:
    #   +[{code: 'bred', message: "Invalid item bread"}]+
    def scan(*grocery_codes)
      response = @input_validator.validate(*grocery_codes)
      response = Response.new(data: Receipt.new(grocery_codes, repo: @repo)) if response.valid?
      response
    end
  end
end
