def nice?(string)
  string.match(/(\w\w).*\1/) &&
  string.match(/(\w).\1/)
end

puts $stdin.each_line.count {|line| nice? line}
