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

y = 1
x = 0

if cave[y][x] == "~"
  puts "yes ~ at #{y} #{x}"
else
  puts "no ~ at at #{y} #{x}"
  abort "Cave in unexpected format"
end

current_location = [x,y]
x_coordinate = 0
y_coordinate = 1

p current_location
p current_location[x_coordinate]
p current_location[y_coordinate]

depth_of_water[current_location[x_coordinate]] = 1           # playing with indices here to make sure they are
                                # acting as I expect.
p depth_of_water

x_coordinate =+ 1

p x_coordinate

depth_of_water[current_location[x_coordinate]] = 1

p depth_of_water

def water_flow(x,y,cave)
  
end
# step.times do |j|                # this code is going to access my method a number
#   puts "#{j}"                    # of times as passed in from the input file (step)
# end

# cave.each do |row|
#   p row
# end

# cave.each do |row|
#   puts row << row.strip
# end
# p cave