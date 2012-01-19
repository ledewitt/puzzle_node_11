# Luke DeWitt
# Puzzle Node - Problem 11

step = nil                           # set variables
cave = [ ]

open("simple_cave.txt") do |f|
  step = f.gets.to_i              # get first line as an int to step variable
  
  f.gets                          # throw out the next line
                                     # nicer to look for the start of cave if 
                                     # the incoming file doesn't have exact format
                                  
  f.each do |line|                # process each line of the cave
    
    cave << line.strip.split("")  # load each "line" into cave
                                  # "strip "out the newlines
                                  # "split" splits out every line into
                                  # individual strings (charaters) for each space
  end
  
end

# here will live something to figure out the cave depth

# checking what I have on hand with this output
p step
puts

y = 0
x = 1

if cave[y][x] == "~"
  puts "yes ~ at " + y.to_s + " " + x.to_s
else
  puts "no ~ at " + y.to_s + " " + x.to_s
end

y = 1
x = 0

if cave[y][x] == "~"
  puts "yes ~ at " + y.to_s + " " + x.to_s
else
  puts "no ~ at " + y.to_s + " " + x.to_s
end

# cave.each do |row|
#   p row
# end

# cave.each do |row|
#   puts row << row.strip
# end
# p cave