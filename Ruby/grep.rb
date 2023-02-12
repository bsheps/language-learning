puts "Basic grep."
puts "File name?"
file = gets.chop
puts "Phrase to search?"
phrase = gets.chop
puts "Searching #{file} for \"#{phrase}\""

f = File.open(file)
lines = f.readlines
lines.each_index{|index|
    puts "#{index} #{lines[index]}" if lines[index].include?(phrase)
}
