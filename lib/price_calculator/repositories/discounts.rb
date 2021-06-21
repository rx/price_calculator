# frozen_string_literal: true

require_relative 'base'
require_relative '../models/inventory_discount'
module PriceCalculator
  module Repositories
    # Discount repository
    # Fetches +Discount+ models
    # Takes an optional path
    class Discounts < Base
      def initialize(path: nil)
        super(:discounts, path)
      end

      # Finds an inventory item by code.
      # Returns an +Discount+ or +nil+ if not found
      def find_by_code(code)
        record = fetch(code)
        record ? Models::InventoryDiscount.new(record.merge(code: code)) : nil
      end
    end
  end
end
