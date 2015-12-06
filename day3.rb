x1 = 0
y1 = 0
x2 = 0
y2 = 0
locs = {"#{x1}, #{y1}" => true}
unique = 1
char_count = 0
File.open("input_day_3.txt", "r") do |f|
  f.each_line do |line|
    line.strip.chars.each do |c|
    #'^>v<'.chars.each do |c|
      if (char_count % 2) == 0
        x1 += 1 if c == '>'
        x1 -= 1 if c == '<'
        y1 += 1 if c == '^'
        y1 -= 1 if c == 'v'
        if locs["#{x1}, #{y1}"].nil? 
          puts "new 1"
          unique += 1
          locs["#{x1}, #{y1}"] = true
        end
      else
        x2 += 1 if c == '>'
        x2 -= 1 if c == '<'
        y2 += 1 if c == '^'
        y2 -= 1 if c == 'v'
        if locs["#{x2}, #{y2}"].nil? 
          puts "new 2"
          unique += 1
          locs["#{x2}, #{y2}"] = true
        end
      end
      char_count += 1
    end
  end
end
puts unique
