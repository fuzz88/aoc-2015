max_distance = 0

# Read all input lines
input_lines = $stdin.readlines

input_lines.each do |line|
  if line =~ /^(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds/
    name = $1
    speed = $2.to_i
    fly_time = $3.to_i
    rest_time = $4.to_i
    
    # Total cycle time (flying + resting)
    cycle_time = fly_time + rest_time
    # Number of complete cycles within the total time
    full_cycles = 2503 / cycle_time
    # Remaining time after complete cycles
    remaining_time = 2503 % cycle_time
    
    # Total distance covered in complete cycles
    distance = full_cycles * speed * fly_time
    # Add distance for the remaining flying time (if any)
    distance += speed * [remaining_time, fly_time].min

    max_distance = [max_distance, distance].max
  end
end

puts max_distance
