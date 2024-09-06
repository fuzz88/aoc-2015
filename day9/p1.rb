require 'set'

def find_shortest_route(distances)
  cities = distances.keys.to_set
  shortest_route = Float::INFINITY

  # Generate all permutations of cities
  cities.to_a.permutation.each do |route|
    total_distance = 0
    route.each_cons(2) do |from, to|
      total_distance += distances[from][to]
    end
    # Update shortest route if the current route is shorter
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

shortest_distance = find_shortest_route(distances)
puts "The shortest route has a distance of #{shortest_distance}"
