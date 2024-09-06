input = "3113322113"

def one_round(seq)
  seq
end

40.times do
  input = one_round(input)
end

puts input.length
