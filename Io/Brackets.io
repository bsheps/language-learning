Object squareBrackets := Object getSlot("list")

a := [1, 2, 3] 
a println

a = [1,[2,3]]
a println

a = [1,[2,[3]]]
a println
a flatten println

/* console output from program
list(1, 2, 3)
list(1, list(2, 3))
list(1, list(2, list(3)))
list(1, 2, 3)
*/