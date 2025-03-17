# frozen_string_literal: true

# StringCalculator module computes the sum of numbers in a given string.
module StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = get_delimiter(numbers)
    numbers = remove_delimiter_prefix(numbers)

    num_array = numbers.split(delimiter).map(&:to_i)

    raise_if_negative(num_array)

    num_array.reject { |num| num > 1000 }.sum
  end

  def self.compute_nums(nums, operator)
    num_array = nums.split(",").map(&:to_i)

    case operator
    when "+"
      num_array.inject(0, &:+)
    when "*"
      num_array.inject(1, &:*)
    end
  end

  private

  def self.remove_delimiter_prefix(numbers)
    return numbers.split("\n", 2)[1] if numbers.start_with?("//[")
    return numbers[4..] if numbers.start_with?("//")

    numbers
  end

  def self.get_delimiter(numbers)
    return /[\n,]/ unless numbers.start_with?("//")

    delimiters = numbers.scan(/\[(.*?)\]/).flatten
    delimiters = [numbers[2]] if delimiters.empty? # For single-character case

    Regexp.union(delimiters) # Converting to regex for splitting
  end

  def self.raise_if_negative(num_array)
    negatives = num_array.select(&:negative?)
    raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?
  end
end
