# frozen_string_literal: true

require_relative 'discounts'
require_relative '../models/inventory_item'

module PriceCalculator
  module Repositories
    # Inventory repository
    class Inventory < Base
      def initialize(path: nil, discounts_rep: Discounts.new)
        @discounts_rep = discounts_rep
        super(:inventory, path)
      end

      # Returns an +InventoryItem+ or nil if not found
      def find_by_code(code)
        record = fetch(code)
        return unless record

        Models::InventoryItem.new(**record.merge(code: code,
                                                 discount: @discounts_rep.find_by_code(code)))
      end

      def valid_codes
        @records.keys.map(&:to_s)
      end
    end
  end
end
