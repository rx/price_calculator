# frozen_string_literal: true

module PriceCalculator
  module Models
    # The InventoryDiscount model
    # Attributes:
    #   * code - the code of the item
    #   * quantity - the quantity to apply the discount to
    #   * price - +BigDouble+ the price of the item
    InventoryDiscount = Struct.new(:code, :quantity, :price, keyword_init: true)
  end
end
