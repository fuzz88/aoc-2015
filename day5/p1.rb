def nice?(string)
  vowels = "aeiou"
  restricted = ["ab", "cd", "pq", "xy"]

  !restricted.any? { |substring| string.include?(substring) } &&
  string.match(/(\w)\1/) &&
  string.chars.count { |char| vowels.include?(char) } >= 3
end

puts $stdin.each_line.count {|line| nice?(line)}
