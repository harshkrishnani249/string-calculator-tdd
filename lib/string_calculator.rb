# frozen_string_literal: true

# StringCalculator module computes the sum of numbers in a given string.
module StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..]
      return numbers.split(delimiter).map(&:to_i).sum
    end

    numbers.split(/[\n,]/).map(&:to_i).sum
  end
end
