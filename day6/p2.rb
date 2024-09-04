grid = Array.new(1000) { Array.new(1000, 0) }

$stdin.each_line do |line|
  match = line.match(/(turn off|toggle|turn on) (\d+),(\d+) through (\d+),(\d+)/)
  command = match[1]
  x1 = match[2].to_i
  y1 = match[3].to_i
  x2 = match[4].to_i
  y2 = match[5].to_i
  (x1..x2).each do |x|
    (y1..y2).each do |y|
      case command
      when 'turn on'
        grid[x][y] = grid[x][y] + 1
      when 'turn off'
        grid[x][y] = grid[x][y] == 0 ? 0 : grid[x][y] - 1 
      when 'toggle'
        grid[x][y] = grid[x][y] + 2
      end
    end
  end
end

def count_all(grid)
  count = 0
  grid.each do |row|
    row.each do |cell|
      count += cell
    end
  end
  count
end

puts count_all grid
