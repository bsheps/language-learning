# START:range
OperatorTable addAssignOperator(":", "atPutNumber")
# END:range
# START:curlyBrackets
curlyBrackets := method(
  call message arguments println
  r := Map clone
  call message arguments foreach(arg,
       r doString(arg asString)
       )
  r
)
# END:curlyBrackets
# START:atPutNumber
Map atPutNumber := method(
  call message name println
  self atPut(
       call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
       call evalArgAt(1) 
  )
)

// List atPutNumber := method(
//   "hello" println
// )

// Sequence atPutNumber := method(
//   call message name println
//   r := Map clone
//   r atPut(
//     call evalArgAt(0),
//     call evalArgAt(1)
//   )
//   r
// )

# END:atPutNumber
# START:use
// s := File with("phonebook.txt") openForReading contents
// phoneNumbers := doString(s)
// phoneNumbers println
// phoneNumbers keys   println
// phoneNumbers values println
# END:use

a := {"Hello":"world", "beans": "rice"}
a println
