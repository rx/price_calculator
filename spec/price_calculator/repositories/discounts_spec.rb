# frozen_string_literal: true

require 'price_calculator'

module PriceCalculator
  module Repositories
    RSpec.describe Discounts do
      context 'valid input' do
        let(:path) { File.expand_path('../../config', __dir__) }
        let(:repo) { Discounts.new(path: path) }
        it 'finds by code' do
          expect(repo.find_by_code('milk')).not_to eq(nil)
          expect(repo.find_by_code('milk').quantity).to eq(2)
        end
      end
    end
  end
end
