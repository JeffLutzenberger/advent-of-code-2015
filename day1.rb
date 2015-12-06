floor = 0
find_basement = true
char_count = 0
File.open("input_day_1.txt", "r") do |f|
  f.each_line do |line|
    line.chars.each do |c|
      floor = c == '(' ? floor += 1 : floor -= 1
      char_count += 1
      if find_basement == true && floor == -1
        puts char_count
        break
      end
    end
  end
end
puts floor
