paper = 0
ribbon = 0
File.open("input_day_2.txt", "r") do |f|
  f.each_line do |line|
    a = line.strip.split('x').map { |d| d.to_i }.sort
    paper += 3 * a[0] * a[1] + 2 * a[1] * a[2] + 2 * a[2] * a[0]  
    ribbon += 2 * a[0] + 2 * a[1] + a[0] * a[1] * a[2]
  end
end
puts paper
puts ribbon
