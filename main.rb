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
                                  # individual strings for each space
  end
  
end

# here will live something to figure out the cave depth

# checking my output
p step
puts "\n"

cave.each do |row|
  p row
end