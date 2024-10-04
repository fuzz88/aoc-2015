# Sample input as a string
input = <<~DATA
Vixen can fly 19 km/s for 7 seconds, but then must rest for 124 seconds.
Rudolph can fly 3 km/s for 15 seconds, but then must rest for 28 seconds.
Donner can fly 19 km/s for 9 seconds, but then must rest for 164 seconds.
Blitzen can fly 19 km/s for 9 seconds, but then must rest for 158 seconds.
Comet can fly 13 km/s for 7 seconds, but then must rest for 82 seconds.
Cupid can fly 25 km/s for 6 seconds, but then must rest for 145 seconds.
Dasher can fly 14 km/s for 3 seconds, but then must rest for 38 seconds.
Dancer can fly 3 km/s for 16 seconds, but then must rest for 37 seconds.
Prancer can fly 25 km/s for 6 seconds, but then must rest for 143 seconds.
DATA

# Parse the input
reindeer = []
input.each_line do |line|
  if line =~ /(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds/
    name = $1
    speed = $2.to_i
    fly_time = $3.to_i
    rest_time = $4.to_i
    reindeer << { name: name, speed: speed, fly_time: fly_time, rest_time: rest_time, points: 0 }
  end
end

total_time = 2503

# Simulate the race
(1..total_time).each do |second|
  reindeer.each do |r|
    # Calculate the total cycle time
    cycle_time = r[:fly_time] + r[:rest_time]
    full_cycles = second / cycle_time
    remaining_time = second % cycle_time

    # Calculate distance
    distance = full_cycles * r[:fly_time] * r[:speed]
    distance += [remaining_time, r[:fly_time]].min * r[:speed]  # Add the flying distance of remaining time

    r[:distance] = distance
  end

  # Determine the max distance at the end of this second
  max_distance = reindeer.map { |r| r[:distance] }.max

  # Award points to reindeer(s) that are in the lead
  reindeer.each do |r|
    r[:points] += 1 if r[:distance] == max_distance
  end
end

# Find the reindeer with the maximum points
winner_points = reindeer.map { |r| r[:points] }.max

puts "The winning reindeer has #{winner_points} points."
