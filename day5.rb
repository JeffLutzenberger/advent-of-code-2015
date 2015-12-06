def has_bad_combos(str)
  /ab|cd|pq|xy/.match(str)
end

def three_vowels(str)
  vowels = ['a', 'e', 'i', 'o', 'u']
  count = 0
  str.chars.each do |c|
    count += 1 if vowels.include? c
    return true if count > 2 
  end
  false
end

def twice_in_a_row(str)
  prev_char = nil
  str.chars.each do |c|
    return true if !prev_char.nil? && !c.nil? && prev_char == c
    prev_char = c
  end
  false
end

def match_pair(c1, c2, chars)
  prev = nil
  chars.each do |c|
    if !prev.nil? && c1 == prev && c2 == c
      return true
    end
    prev = c
  end
  false
end

def find_non_overlapping_pairs(str)
  prev = nil
  chars = str.chars
  i = 1
  n = chars.length - 1
  chars.each do |c|
    if !prev.nil? && i < n
      return true if match_pair(prev, c, chars[i..n]) == true
    end
    prev = c
    i += 1
  end
  false
end

def repeat_with_one_between(str)
  prev_char = nil
  prev_prev_char = nil
  str.chars.each do |c|
    if !prev_prev_char.nil? && prev_prev_char == c
      return true
    end
    prev_prev_char = prev_char if !prev_char.nil?
    prev_char = c
  end
  false
end

nice = 0
File.open("input_day_5.txt", "r") do |f|
  f.each_line do |line|
  #line = "ieodomkazucvgmuy"
    l = line.strip
    # next if has_bad_combos(l)
    # nice += 1 if twice_in_a_row(l) && three_vowels(l)
    nice += 1 if find_non_overlapping_pairs(l) && repeat_with_one_between(l)
  end
end
puts nice
