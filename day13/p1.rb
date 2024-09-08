persons = Hash.new { |hash, key| hash[key] = {} }

$stdin.each_line do |line|
  match = line.match(/^(\w+) would (gain|lose) (\d*).* (\w+)./)
  sign = match[2] == "gain" ? 1 : -1
  persons[match[1]][match[4]] = sign * match[3].to_i
end

puts persons.keys.inspect
