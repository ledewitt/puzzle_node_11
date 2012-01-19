# Luke DeWitt
# Puzzle Node - Problem 11

step = nil                           # set variables
cave = [ ]
depth_of_water = [ ]

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

location = {x: 0, y: 1}

if cave[location[:y]][location[:x]] == "~"
  puts "yes ~ at #{location[:x]} #{location[:y]}"
else
  puts "no ~ at at #{location[:x]} #{location[:y]}"
  abort "Cave in unexpected format"
end
 
p location
p location[:x]
p location[:y]

p depth_of_water

depth_of_water[location[:x]] = 1           # playing with indices here to make sure they are
                                           # acting as I expect.
p depth_of_water

location[:x] =+ 1
 
p location[:x]
 
depth_of_water[location[:x]] = 1
 
p depth_of_water

# def water_flow(x,y,cave)
#   puts "Hello you are calling me!"
# end
# 
# 
# step.times do                # this code is going to access my method a number
#   water_flow(location[:x],location[:y],cave)                    # of times as passed in from the input file (step)
# end

# cave.each do |row|
#   p row
# end

# cave.each do |row|
#   puts row << row.strip
# end
# p cave