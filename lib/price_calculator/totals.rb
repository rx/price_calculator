# frozen_string_literal: true

require 'bigdecimal'

module PriceCalculator
  # Totals class
  # Takes the inventory items and discounts and calculates the totals based on a grocery list
  # These classes return BigDecimal for the amounts.
  class Totals
    # new
    # @param [Map] items inventory items
    # @param [Map] discounts inventory discounts
    # @param [Array] groceries being purchased
    def initialize(inventory_items, discounts, *groceries)
      @inventory_items = inventory_items
      @discounts = discounts
      @groceries = *groceries
      apply_discounts!
    end

    def items
      histogram
    end

    def total
      histogram.map { |_, attributes| attributes[:discounted_price] }.sum
    end

    def discount
      histogram.map { |_, attributes| attributes[:total_price] - attributes[:discounted_price] }.sum
    end

    private

    def histogram
      @historgram ||= @groceries.each_with_object({}) do |item, new_hash|
        new_hash[item] ||= { quantity: 0 }
        new_hash[item][:quantity] += 1
        new_hash[item][:name] = @inventory_items[item]['name']
      end
      @historgram
    end

    def apply_discounts!
      histogram.each do |item, attributes|
        item_price = BigDecimal(@inventory_items[item]['price'].to_s)
        discounted_price = discounted_price(item, attributes, item_price)
        attributes[:total_price] = (item_price * attributes[:quantity])
        attributes[:discounted_price] = discounted_price || attributes[:total_price]
      end
    end

    def discounted_price(item, attributes, item_price)
      return unless @discounts[item]

      discounted_price = BigDecimal(@discounts[item]['price'].to_s)
      attributes[:discounted_price] = (attributes[:quantity] / @discounts[item]['quantity'] * discounted_price +
        attributes[:quantity] % @discounts[item]['quantity'] * item_price)
    end
  end
end
