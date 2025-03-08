# frozen_string_literal: true

# StringCalculator module computes the sum of numbers in a given string.
module StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = remove_delimiter_prefix(numbers)
      return numbers.split(delimiter).map(&:to_i).sum
    end

    numbers.split(/[\n,]/).map(&:to_i).sum
  end

  private

  def self.remove_delimiter_prefix(numbers)
    numbers.start_with?("//") ? numbers[4..] : numbers
  end
end
