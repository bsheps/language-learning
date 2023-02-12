# Find 

 - How to access files with and without code blocks? what is benefit of code block?
 ```ruby
f = File.open("guess.rb")
lines = f.readlines
f.close

#with blocks

Not too sure about the block codes piece
File.open("guess.rb").readlines
maybe?
```
- Translate hash to array? Can translate array to hash?
```ruby
# hash to array
numbers = {1 => 'one', 2 => 'two'}
array = []
numbers.each_pair {|key,val| array.push([key,val])}

# array to hash
hash = {}
array.each {|item| hash[ item[0] ] = item[1] }
```

- Can you iterate through a hash?
yes, see above for `each_pair`. `each_key` and `each_value` can also be used.

- Ruby arrays can be used as stacks. What other common data structs do array support?
Stack - push, pop
Queue - shift (aka remove first element), push (aka add element to end of queue)

# Do

 - Print an array containing 16 numbers, but only 4 numbers at a time using just `each`. Now do the same with `each_slice` in Enumerable
```ruby
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
                                                                                                                         
 # using each_slice in Enumerable                                                                             
 array.each_slice(4) {|e| print "#{e}\n" }
 ```

 - Let the tree class accept a nested structure with hashes and arrays

 ```ruby
 nested_tree = {’grandpa’ => { ’dad’ => {’child 1’ => {}, ’child 2’ => {} }, ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }
 ```

 - Write a simple grep that prints the lines of a file having any occurrences of a phrase anywhere in the line, include line numbers
 ```ruby
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
 ```
