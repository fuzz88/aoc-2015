input = "3113322113"

def one_round!(seq)
  seq.scan(/(\d)(\1*)/).map { |group| [1 + group[1].length, group[0]] }
    .flatten
    .join
end

ARGV[0].to_i.times { input = (one_round! input) }
puts input.length
