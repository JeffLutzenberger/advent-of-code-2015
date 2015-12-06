require 'digest'

def first_n_zeros(n, str)
  count = 0
  str.chars.each do |c|
    if c == '0'
      count += 1
      return true if count == n
    else
      return false
    end
  end
  false
end


hd = ""
num = -1
key = "iwrupvqb"
while(!first_n_zeros(6, hd)) do
  num += 1
  hd = Digest::MD5.hexdigest("#{key}#{num}")
  #puts "#{key}#{num}"
end

puts num
puts hd

