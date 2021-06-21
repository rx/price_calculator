# frozen_string_literal: true

require 'price_calculator'

RSpec.describe PriceCalculator::Response do
  context 'empty' do
    it 'validates' do
      response = PriceCalculator::Response.new
      expect(response.valid?).to eq(true)
    end
  end
  context 'data only' do
    let(:valid_data) { [:one] }
    it 'validates' do
      response = PriceCalculator::Response.new
      expect(response.valid?).to eq(true)
    end
    it 'returns data' do
      response = PriceCalculator::Response.new(data: valid_data)
      expect(response.data).to eq(valid_data)
    end
    it 'errors are empty' do
      response = PriceCalculator::Response.new(data: valid_data)
      expect(response.errors).to eq([])
    end
  end
  context 'data and errors' do
    let(:data) { [:one] }
    let(:errors) { [:two] }

    it 'does not validate' do
      response = PriceCalculator::Response.new(data: data, errors: errors)
      expect(response.valid?).to eq(false)
    end
    it 'returns data' do
      response = PriceCalculator::Response.new(data: data, errors: errors)
      expect(response.data).to eq(data)
    end
    it 'returns errors' do
      response = PriceCalculator::Response.new(data: data, errors: errors)
      expect(response.errors).to eq(errors)
    end
  end
end
