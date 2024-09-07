input = $stdin.read()

def inc_password(password)
  password
end

def is_secure?(password) 
  true
end

next_password = input

while !is_secure?(next_password) do
  next_password = (inc_password password)
end

puts next_password
