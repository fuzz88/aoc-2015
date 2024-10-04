max_dist = 0

$stdin.readlines.each do |line|
  m = line.match(/^(\w*) can fly (\d*).* for (\d*).* for (\d*)/)
  dist = 0
  t = 0
  while t < 2503 do
    dist = dist + m[2].to_i * m[3].to_i
    t = t + m[3].to_i + m[4].to_i
  end 
  max_dist = dist if dist > max_dist
end

puts max_dist
