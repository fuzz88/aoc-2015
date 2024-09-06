diff = 0

$stdin.each_line do |line|
  line = line[1..-3]
  diff = diff + 4
  diff = diff + line.scan(/\"/).count
  diff = diff + line.scan(/\\/).count
end

puts diff
