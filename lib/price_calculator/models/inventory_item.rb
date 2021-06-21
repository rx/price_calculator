# frozen_string_literal: true

require_relative 'base'
require_relative '../repositories/discounts'

module PriceCalculator
  module Models
    # The +InventoryItem+ model
    # Attributes:
    #   * code - +String+ used to look up items
    #   * name - +String+ display name
    #   * price - +BigDouble+ the price of the item
    #   * discount - +ItemDiscount+ the discount for an item, nil if none
    InventoryItem = Struct.new(:code, :name, :price, :discount, keyword_init: true)
  end
end
