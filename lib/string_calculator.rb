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

  private

  def self.remove_delimiter_prefix(numbers)
    if numbers.start_with?("//[")
      numbers.split("\n", 2)[1]
    elsif numbers.start_with?("//")
      numbers[4..]
    else
      numbers
    end
  end

  def self.get_delimiter(numbers)
    if numbers.start_with?("//[")
      numbers.match(%r{//\[(.+?)\]})[1]
    elsif numbers.start_with?("//")
      numbers[2]
    else
      /[\n,]/
    end
  end

  def self.raise_if_negative(num_array)
    negatives = num_array.select(&:negative?)
    raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?
  end
end
