input = "3113322113"
N = ARGV[0].to_i

def one_round!(s)
  ( s.scan(/(\d)(\1*)/).map { |group| [1 + group[1].length, group[0]] } ).flatten.join
end

N.times { input = one_round! input }
puts input.length

