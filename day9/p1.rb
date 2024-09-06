require 'set'

def find_shortest_route(distances)
  cities = distances.keys.to_set
  shortest_route = Float::INFINITY

  cities.to_a.permutation.each do |route|
    total_distance = 0
    route.each_cons(2) do |from, to|
      total_distance += distances[from][to]
    end
    shortest_route = [shortest_route, total_distance].min
  end

  shortest_route
end

distances = Hash.new { |hash, key| hash[key] = {} }

$stdin.each_line do |line|
  m = line.match(/(.*) to (.*) = (\d*)/)
  distances[m[1]][m[2]] = m[3].to_i
  distances[m[2]][m[1]] = m[3].to_i
end

puts find_shortest_route(distances)
