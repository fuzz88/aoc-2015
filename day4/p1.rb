require 'digest'

salt = $stdin.read().chomp

num = 0
while (Digest::MD5.hexdigest salt + num.to_s)[0..4] != "00000" do
  num += 1
end
puts num
