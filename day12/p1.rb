def sum_numbers_from_string(str)
  # Use a regular expression to find all sequences of digits
  numbers = str.scan(/-?\d+/)
  
  # Convert each sequence of digits to an integer and sum them up
  numbers.map(&:to_i).sum
end

puts sum_numbers_from_string($stdin.read().chomp)
