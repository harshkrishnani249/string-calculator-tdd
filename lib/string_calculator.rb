# frozen_string_literal: true

# StringCalculator module computes the sum of numbers in a given string.
module StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = get_delimiter(numbers)
    numbers = remove_delimiter_prefix(numbers)

    num_array = numbers.split(delimiter).map(&:to_i)

    negatives = num_array.select { |num| num < 0 }
    raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

    num_array.sum
  end

  private

  def self.remove_delimiter_prefix(numbers)
    numbers.start_with?("//") ? numbers[4..] : numbers
  end

  def self.get_delimiter(numbers)
    numbers.start_with?("//") ? numbers[2] : /[\n,]/
  end
end
