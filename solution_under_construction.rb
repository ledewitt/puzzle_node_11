# Luke DeWitt
# Puzzle Node - Problem 11

step = nil                           # set variables
cave = [ ]
depth_of_water = [ ]
water_column = 0

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
# puts

location = {x: 0, y: 1}

if cave[location[:y]][location[:x]] == "~"
  puts "yes ~ at #{location[:x]} #{location[:y]}"
else
  puts "no ~ at at #{location[:x]} #{location[:y]}"
  abort "Cave in unexpected format"
end

depth_of_water[location[:x]] = depth_of_water[location[:x]]

length_of_cave = cave[0].count

p length_of_cave

depth_of_water.fill( 0 , 0..length_of_cave)

p depth_of_water

depth_of_water[location[:x]] = 1

p depth_of_water

# p location
# p location[:x]
# p location[:y]
# 
# p depth_of_water
# 
# depth_of_water[location[:x]] = 1           # playing with indices here to make sure they are
#                                            # acting as I expect.
# p depth_of_water
# 
# location[:x] =+ 1
#  
# p location[:x]
#  
# depth_of_water[location[:x]] = 1
#  
# p depth_of_water

def find_waters_next_step(location,cave)
  # p "I'm the function that finds the water flow next step"
  next_step = [0,0]
    
  if cave[location[:y] + 1][location[:x]]  == " "     # Attempt to flow down
    next_step[1] = 1
  elsif cave[location[:y]][location[:x] + 1] == " "    # If unable to flow down try to flow right
    next_step[0] = 1
  else          #back carraige return to a ~ once we reach a cave wall
    p "Water has no where to go"
    next_step[1] = -1                          # go up one level in the cave
    
    # Breaking some ruby rules right here to go backwards in the cave to find a blank space to fill
    
    while cave[location[:y] + next_step[1]][location[:x] + next_step[0] - 1] == " "
      next_step[0] += -1
    end
  end
  next_step
end

def water_flow(location,cave,water_column,depth_of_water)
  # puts "Hello, are you calling me!"

  next_step = find_waters_next_step(location,cave)
  
  p next_step

  location[:x] = location[:x] + next_step[0]
  location[:y] = location[:y] + next_step[1]
  
  cave[location[:y]][location[:x]] = "~"
  
  depth_of_water[location[:x]] += 1
  
end

step = 45  # Work with a smaller number of steps

step.times do                                 # this code is going to access my method a number
  water_flow(location,cave,water_column,depth_of_water)      # of times as passed in from the input file (step)
  p location
  cave.each { |x| p x }
  p depth_of_water
end

# cave.each do |row|
#   p row
# end

# cave.each do |row|
#   puts row << row.strip
# end