# Luke DeWitt
# Puzzle Node - Problem 11

#####  METHODS #####

def find_waters_next_step(location,cave)
  
  next_step = [0,0]
    
  if cave[location[:y] + 1][location[:x]]  == " "     # Attempt to flow down
    next_step[1] = 1
  elsif cave[location[:y]][location[:x] + 1] == " "    # If unable to flow down try to flow right
    next_step[0] = 1
  else                        # Back carraige return to a ~ once we reach a cave wall
    next_step[1] = -1                          # go up one level in the cave
    while cave[location[:y] + next_step[1]][location[:x] + next_step[0] - 1] == " "
      next_step[0] += -1
    end
  end
  
  next_step
end

def water_flow(location,cave,water_column,depth_of_water)
  
  next_step = find_waters_next_step(location,cave)

  location[:x] = location[:x] + next_step[0]
  location[:y] = location[:y] + next_step[1]
  
  cave[location[:y]][location[:x]] = "~"
  
  depth_of_water[location[:x]] += 1
end

#####  MAIN BODY OF CODE #####

step = nil                           # set variables
cave = [ ]
depth_of_water = [ ]
water_column = 0

open("simple_cave.txt") do |f|
  step = f.gets.to_i              # get first line as an int to step variable
  f.gets                                
  f.each do |line|                # process each line of the cave   
    cave << line.strip.split("")
  end
end

location = {x: 0, y: 1}

if cave[location[:y]][location[:x]] == "~"
  # puts "yes ~ at #{location[:x]} #{location[:y]}"
else
  puts "no ~ at at #{location[:x]} #{location[:y]}"
  abort "Cave in unexpected format"
end

length_of_cave = cave[0].count                  # Populate array to track depth of water
depth_of_water.fill( 0 , 0..length_of_cave)
depth_of_water[location[:x]] = 1

step.times do                                                # this code is going to access my method a number
  water_flow(location,cave,water_column,depth_of_water)      # of times as passed in from the input file (step)

  # Uncomment below code to debug each step of program
  # p location
  # cave.each { |x| p x }
  # p depth_of_water
end

# Uncomment below code to see the sum of the water depth in cave
# NOTE currently this does not equal the number of steps because of
# the starting ~ in cave so my answer doesn't match the example cave

# p depth_of_water.inject{|sum,x| sum + x }

# Edge case of falling water

if cave[location[:y] + 1][location[:x]]  == " "
  depth_of_water[location[:x]] = "~"
end

# p cave.each { |x| p x }
p depth_of_water
