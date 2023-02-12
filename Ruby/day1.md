## Find
 - Ruby api: https://rubyapi.org/ or ruby-doc.org
 - Book: Programming Ruby, the pragmatic programmers guide: https://jmvidal.cse.sc.edu/library/thomas05a.pdf
 - substitute part of a string: https://ruby-doc.org/core-2.4.2/String.html#method-i-sub
    ```ruby 
    "hello, world".sub('world', 'earth')
    ```
 - Info on ruby's regex: https://ruby-doc.org/3.2.0/Regexp.html
 - Info on ruby's ranges: https://ruby-doc.org/core-2.5.1/Range.html
 -----
## Do:
  - print hello world: puts "hello world"
  - Find index of word "Ruby" in Hello, Ruby string: "Hello, Ruby": "hello, ruby".index("ruby") => 7
  - print name 10x: 
    ```ruby
    i = 0 
    while i < 10
        i = i + 1
        puts "bs"
    end
    ```
 - print "this is sentence number #" where # is from 1-10
   ```ruby
   i = 1
   while i <= 10
       puts "This is sentence number #{i}"
       i = i + 1
   end
   ```
 - run a ruby file: ruby someFile.rb 
 - bonus: guess.rb
