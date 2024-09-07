input = $stdin.read().chomp

def inc_char(char)
  chars = ("a".."z").to_a
  chars_count = chars.length
  char_index = chars.index(char)
  next_index = (char_index + 1) 
  overflow = next_index >= chars_count
  next_index =  !overflow ? next_index : next_index % chars_count
  [overflow, chars[next_index]]
end

def inc_password(password)
  password.reverse!
  char_index = 0
  overflow = true
  while overflow do
    overflow, password[char_index] = inc_char(password[char_index])
    char_index = char_index + 1
  end
  password.reverse
end

def is_secure?(password) 
  # Check for forbidden characters
  return false if password =~ /[iol]/

  # Check for at least one increasing straight of at least three letters
  increasing_straight = /abc|bcd|cde|def|efg|fgh|fgh|ghi|hij|ijk|jkl|klm|lmn|mno|nop|opq|pqr|qrs|rst|stu|tuv|uvw|vwx|wxy|xyz/
  return false unless password =~ increasing_straight

  # Check for at least two different, non-overlapping pairs of letters
  pairs = password.scan(/(.)\1/).map(&:first)
  return false if pairs.uniq.size < 2

  true
end

next_password = input

while !is_secure?(next_password) do
  next_password = (inc_password next_password)
end

puts next_password

next_password = inc_password(next_password)

while !is_secure?(next_password) do
  next_password = (inc_password next_password)
end

puts next_password
