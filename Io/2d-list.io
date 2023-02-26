List2d := Object clone

List2d dim := method(x, y,
        self arr := List clone
        for(i, 1, x, 
            col := List clone
            for(j, 1, y,
                col push(nil)
            )
            arr push(col)
        )
    )

List2d set := method(x, y, value,
        arr at(x) atPut(y, value)
        self
    )

List2d get := method(x,y,
        self arr at(x) at(y)
    )

List2d transpose := method(
    new_matrix := List2d clone
    new_matrix dim(arr at(0) size, arr size)
    arr foreach(i, row, 
        row foreach(j, value,
            new_matrix set(j, i, value)
        )
    )
    new_matrix
)

List2d toFile := method( fileName,
    file := File clone open(fileName)
    self arr foreach(row,
            row foreach(col,
                file write(col asString, " ")
            )
            file write("\n")
        )
)

List2d fromFile := method( fileName,
    lines := File clone openForReading(fileName) readLines
    self arr := List clone
    lines foreach(row,
        cols := row split
        self arr append(cols)
    )
    self
)

myList := List2d clone

// initialize
myList dim(2,2)

// populate
myList set(0,0,1)
myList set(0,1,2)
myList set(1,0,3)
myList set(1,1,4)
myList println

// retrieve
myList get(0,0) println
myList get(0,1) println
myList get(1,0) println
myList get(1,1) println

// test overwriting
myList set(0,0,5)
myList println
myList get(0,0) println

// test transpose
myList dim(2,3)
myList set(0,0,1)
myList set(0,1,2)
myList set(0,2,3)
myList set(1,0,4)
myList set(1,1,5)
myList set(1,2,6)
myList println

transposed := myList transpose
transposed println

(transposed get(0,0) == myList get(0,0)) println
(transposed get(0,1) == myList get(1,0)) println
(transposed get(1,0) == myList get(0,1)) println
(transposed get(1,1) == myList get(1,1)) println
(transposed get(2,0) == myList get(0,2)) println
(transposed get(2,1) == myList get(1,2)) println

// write to file
transposed toFile("test.txt")

// read from file
newList := List2d fromFile("test.txt")

newList get(0,0) println
newList get(0,1) println
newList get(1,0) println
newList get(1,1) println
newList get(2,0) println
newList get(2,1) println