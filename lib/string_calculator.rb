# frozen_string_literal: true

# StringCalculator module computes the sum of numbers in a given string.
module StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    num_array = numbers.split(",")
    return num_array[0].to_i if num_array.size == 1
    return num_array[0].to_i + num_array[1].to_i if num_array.size == 2
  end
end
