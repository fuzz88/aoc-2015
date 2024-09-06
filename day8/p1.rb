diff = 0

$stdin.each_line do |line|
  line = line[1..-3]
  diff = diff + 2
  diff = diff + line.scan(/\\\\/).count
  diff = diff + line.scan(/\\\"/).count
  diff = diff + line.scan(/\\x[0-9A-Fa-f]{2}/).count * 3
end

puts diff
