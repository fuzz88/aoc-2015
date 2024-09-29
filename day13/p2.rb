require 'set'

persons = Hash.new { |h, k| h[k] = {} }

# Input file
INPUT_FILE = "test1.txt"

# Parse input
File.readlines(INPUT_FILE).each do |line|
  if line =~ /^(\w+) would (gain|lose) (\d+).* (\w+)\./
    person1, gain_lose, amount, person2 = $1, $2, $3.to_i, $4
    persons[person1][person2] = (gain_lose == "lose" ? -amount : amount)
  end
end

# Add "Victoria" with zero impact
persons.keys.each { |name| persons["Victoria"][name] = persons[name]["Victoria"] = 0 }

# Calculate the happiness of a table arrangement
def table_happiness(table, persons)
  table.each_with_index.sum do |person, i|
    next_person = table[(i + 1) % table.size]
    persons[person][next_person] + persons[next_person][person]
  end
end

# Generate all table arrangements and compute their happiness
def max_happiness(persons)
  persons.keys.permutation.map { |arrangement| table_happiness(arrangement, persons) }.max
end

# Output the maximum happiness
puts max_happiness(persons)

