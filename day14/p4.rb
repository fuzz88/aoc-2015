class Reindeer
  attr_accessor :name, :speed, :fly_time, :rest_time, :points, :distance

  def initialize(name, speed, fly_time, rest_time)
    @name = name
    @speed = speed
    @fly_time = fly_time
    @rest_time = rest_time
    @points = 0
    @distance = 0
  end

  def calculate_distance(seconds)
    cycle_time = @fly_time + @rest_time
    full_cycles = seconds / cycle_time
    remaining_time = seconds % cycle_time

    # Calculate total distance
    @distance = full_cycles * @fly_time * @speed
    @distance += [remaining_time, @fly_time].min * @speed
  end
end

# Sample input as a string
input = $stdin.readlines

# Parse the input
reindeer = []
input.each do |line|
  if line =~ /(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds/
    name = $1
    speed = $2.to_i
    fly_time = $3.to_i
    rest_time = $4.to_i
    reindeer << Reindeer.new(name, speed, fly_time, rest_time)
  end
end

total_time = 2503

# Simulate the race
(1..total_time).each do |second|
  reindeer.each do |r|
    r.calculate_distance(second)
  end

  # Determine the max distance at the end of this second
  max_distance = reindeer.map(&:distance).max

  # Award points to reindeer(s) that are in the lead
  reindeer.each do |r|
    r.points += 1 if r.distance == max_distance
  end
end

# Find the reindeer with the maximum points
winner_points = reindeer.map(&:points).max

puts "The winning reindeer has #{winner_points} points."

