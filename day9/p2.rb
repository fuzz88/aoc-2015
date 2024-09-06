require 'set'

def find_longest_route(distances)
  cities = distances.keys.to_set
  longest_route = 0

  # Generate all permutations of cities
  cities.to_a.permutation.each do |route|
    total_distance = 0
    route.each_cons(2) do |from, to|
      total_distance += distances[from][to]
    end
    # Update longest route if the current route is shorter
    longest_route = [longest_route, total_distance].max
  end

  longest_route
end

distances = Hash.new { |hash, key| hash[key] = {} }

$stdin.each_line do |line|
  m = line.match(/(.*) to (.*) = (\d*)/)
  distances[m[1]][m[2]] = m[3].to_i
  distances[m[2]][m[1]] = m[3].to_i
end

longest_distance = find_longest_route(distances)
puts "The longest route has a distance of #{longest_distance}"
