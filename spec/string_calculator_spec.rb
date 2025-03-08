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

    it "supports newlines as a delimiter ('1\\n2,3' → 6)" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "handles numbers separated only by newlines ('1\\n2\\n3' → 6)" do
      expect(StringCalculator.add("1\n2\n3")).to eq(6)
    end

    it "ignores empty input between newlines ('1\\n\\n2,3' → 6)" do
      expect(StringCalculator.add("1\n\n2,3")).to eq(6)
    end

    it "handles a custom single-character delimiter" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it "returns 7 for the string '//;\n2;5'" do
      expect(StringCalculator.add("//;\n2;5")).to eq(7)
    end

    it "returns 9 for the string '//#\n2#3#4'" do
      expect(StringCalculator.add("//#\n2#3#4")).to eq(9)
    end

    it "raises an exception for a single negative number" do
      expect { StringCalculator.add("-1") }.to raise_error("negatives not allowed: -1")
    end

    it "raises an exception for multiple negative numbers" do
      expect { StringCalculator.add("2,-4,3,-5") }.to raise_error("negatives not allowed: -4, -5")
    end
  end
end
