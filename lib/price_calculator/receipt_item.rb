# frozen_string_literal: true

require 'bigdecimal'

module PriceCalculator
  # A receipt item
  #
  # Note: All amounts are returned as +BigDouble+ to display them use .to_f
  # This prevents any floating point math rounding errors
  class ReceiptItem
    attr_reader :quantity

    def initialize(quantity, item)
      @item = item
      @quantity = quantity
    end

    def code
      @item.code
    end

    def name
      @item.name
    end

    def discounted_price
      return full_price unless @item.discount

      discount = @item.discount
      (@quantity / discount.quantity * discount.price +
        @quantity % discount.quantity * @item.price)
    end

    def full_price
      @item.price * @quantity
    end
  end
end
