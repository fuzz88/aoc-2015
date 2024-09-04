Vector2 = Struct.new(:x, :y) do
  def +(other)
    Vector2.new(self.x + other.x, self.y + other.y)
  end
end

directions = {
  "<" => Vector2.new(-1, 0),
  ">" => Vector2.new(1, 0),
  "^" => Vector2.new(0, -1),
  "v" => Vector2.new(0, 1),
}

visited = [Vector2.new(0,0)] * 2

$stdin.read().chomp.each_char { |c| visited.append(visited[visited.size-2] + directions[c]) }

puts visited.uniq.size
