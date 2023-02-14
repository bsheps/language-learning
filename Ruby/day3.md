# Do
Modify the CSV application to support an each method to return a `CsvRow` object. 
Use `method_missing` on that `CsvRow` to return the value for the column for a given heading. 

For example, for the csv file:

```
one, two
lions, tigers
```

allow an API that works like this:

```ruby
csv = RubyCsv.new
csv.each {|row| puts row.one}
```

This should print "lions".

 - This is a multi step problem. First create the class `CsvRow` inside `InstanceMethods` module.
 - Add initializer and method_missing methods. method_missing will take a string, find the index of that string in the header
 - The row is an array and the element of interest will be at the same index as the header
 - Finally, just wire up the `CsvRow` class to `csv_contents`
