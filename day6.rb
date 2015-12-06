def command(str)
  /ab|cd|pq|xy/.match(str)
end

lights = Hash.new

def switch_light(lights, start_coord, end_coord, turn_on = nil)
  s = start_coord.split(',').map { |c| c.to_i }
  e = end_coord.split(',').map { |c| c.to_i }
  [*s[0]..e[0]].each do |x|
    [*s[1]..e[1]].each do |y|
      str_coord = "#{x},#{y}"
      if turn_on == true
        if lights[str_coord].nil?
          lights[str_coord] = 1
        else
          lights[str_coord] += 1
        end
      elsif turn_on == false
        if !lights[str_coord].nil? && lights[str_coord] == 1
          lights.delete(str_coord)
        elsif !lights[str_coord].nil?
          lights[str_coord] -= 1
        end
      else
        if lights[str_coord].nil?
          lights[str_coord] = 2
        else
          lights[str_coord] += 2
        end
      end
    end
  end
end

def toggle_light(lights, x, y)
  str_coord = "#{x},#{y}"
  if lights[str_coord].nil?
    lights[str_coord] = 1
  else
    lights.delete(str_coord)
  end
end

File.open("input_day_6.txt", "r") do |f|
  f.each_line do |line|
    tokens = line.strip.split(' ')
    if tokens[0] == 'turn' && tokens[1] == 'on'
      switch_light(lights, tokens[2], tokens[4], true)
    elsif tokens[0] == 'turn' && tokens[1] == 'off'
      switch_light(lights, tokens[2], tokens[4], false)
    elsif tokens[0] == 'toggle'
      switch_light(lights, tokens[1], tokens[3])
    end
  end
end
puts lights.keys.length
brightness = 0
lights.each do |_k, v|
  brightness += v
end
puts brightness

