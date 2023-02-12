# Print an array containing 16 numbers, but only 4 numbers at a time using just `each`.
array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
i = 1
array.each {|element|
  $stdout.print(element)
  if i % 4 == 0
    $stdout.print("\n")
  else
    $stdout.print(", ") 
  end
  i = i+1
}

# Do the same with each_slice in Enumerable
puts
puts
array.each_slice(4) {|e| print "#{e}\n" }
