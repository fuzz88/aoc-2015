require 'json'

def sum_numbers_from_json(json_str)
  data = JSON.parse(json_str)

  def sum_recursive(obj)
    case obj
    when Hash
      # If the hash contains any value "red", return 0 (ignore this object)
      return 0 if obj.value?("red")

      # Sum all values in the hash
      obj.values.map { |v| sum_recursive(v) }.sum
    when Array
      # Sum all elements in the array
      obj.map { |e| sum_recursive(e) }.sum
    when Integer
      # Return the integer itself
      obj
    else
      # Ignore other types (strings, etc.)
      0
    end
  end

  sum_recursive(data)
end

puts sum_numbers_from_json($stdin.read().chomp)
