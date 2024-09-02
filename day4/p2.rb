require 'digest'

salt = $stdin.read().chomp

num = 0
while (Digest::MD5.hexdigest salt + num.to_s)[0..5] != "000000" do
  num += 1
end
puts num
