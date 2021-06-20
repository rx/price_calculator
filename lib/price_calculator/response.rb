# frozen_string_literal: true

module PriceCalculator
  # Response class
  # Takes an array of data and/or errors
  class Response
    attr_reader :data, :errors

    # new
    # @param [Array] valid_items Valid inventory items
    def initialize(data: [], errors: [])
      @data = data
      @errors = errors
    end

    # valid?
    # @return [boolean] true if the response has no errors.
    def valid?
      errors.empty?
    end
  end
end
