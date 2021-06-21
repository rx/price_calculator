# frozen_string_literal: true

require 'price_calculator'

module PriceCalculator
  module Repositories
    RSpec.describe Inventory do
      context 'valid input' do
        let(:path) { File.expand_path('../../config', __dir__) }
        let(:repo) { Inventory.new(path: path) }

        it 'finds by code' do
          expect(repo.find_by_code('milk')).not_to eq(nil)
        end

        it 'returns valid_codes' do
          expect(repo.valid_codes.count).to eq(5)
        end
      end
    end
  end
end
