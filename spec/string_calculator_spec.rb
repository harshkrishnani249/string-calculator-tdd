# frozen_string_literal: true

# Tests for the StringCalculator module using RSpec
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end
  end
end
