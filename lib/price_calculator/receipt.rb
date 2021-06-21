# frozen_string_literal: true

require 'price_calculator/repositories/inventory'
require_relative 'receipt_item'

module PriceCalculator
  # Create a receipt from a valid list of inventory item codes
  #
  # Note: All amounts are returned as +BigDouble+ to display them use .to_f
  # This prevents any floating point math rounding errors
  class Receipt
    def initialize(item_codes, repo: Repositories::Inventory.new)
      @repo = repo
      @item_codes = item_codes
    end

    # Returns an Array of +ReceiptItem+'s
    def items
      histogram.map do |item_code, quantity|
        ReceiptItem.new(quantity, @repo.find_by_code(item_code))
      end
    end

    def total_due
      items.map(&:discounted_price).sum
    end

    def discount_applied
      items.map(&:full_price).sum - total_due
    end

    private

    # Turns an inventory item code list into a histogram
    # ['bread','bread'] => {'bread'=>2}
    def histogram
      @histogram ||= @item_codes.each_with_object(Hash.new(0)) do |item, new_hash|
        new_hash[item] += 1
      end
    end
  end
end
