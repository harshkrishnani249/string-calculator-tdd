# frozen_string_literal: true

# Tests for the StringCalculator module using RSpec
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number itself when a single number is given" do
      expect(StringCalculator.add("5")).to eq(5)
    end

    it "returns the sum of two numbers" do
      expect(StringCalculator.add("1,2")).to eq(3)
    end

    it "returns the sum of multiple numbers" do
      expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
    end
  end
end
