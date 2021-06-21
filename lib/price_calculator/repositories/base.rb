# frozen_string_literal: true

require 'yaml'
require 'bigdecimal'

module PriceCalculator
  module Repositories
    # Base repository
    # Takes a file base name and path
    # If the path is +nil+ it will default to the config directory
    class Base
      DEFAULT_PATH = File.expand_path('../../../config', __dir__)
      def initialize(file, path)
        path ||= DEFAULT_PATH
        @records = coerce_records(YAML.safe_load(File.read(File.join(path, "#{file}.yml"))))
      end

      def fetch(code)
        @records.fetch(code.to_sym, nil)
      end

      private

      def coerce_records(records)
        records.map do |key, value|
          [key.to_sym, coerce_record(value)]
        end.to_h
      end

      def coerce_record(record)
        record.map do |key, value|
          [key.to_sym, coerce_value(value)]
        end.to_h
      end

      def coerce_value(value)
        value.is_a?(Float) ? BigDecimal(value.to_s) : value
      end
    end
  end
end
