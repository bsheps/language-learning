1. A Fibonacci sequence starts with two 1s. Each subsequent num- ber is the sum of the two numbers that came before: 1, 1, 2, 3, 5, 8, 13, 21, and so on. Write a program to find the nth Fibonacci number. fib(1) is 1, and fib(4) is 3. As a bonus, solve the problem with recursion and with loops.

    ```
    // fib.io
    // Find the nth number in Fibonacci sequence via loop
    FibLoop := method(num, 
        num1 := 1
        num2 := 1

        for(i, 3, num,
            sum := num1 + num2
            num1 = num2
            num2 = sum
        )
        return num2
    )

    // Find the nth number in Fibonacci sequence via recursion
    FibRecurse := method(num,
        if(num <= 2, return 1)
        return FibRecurse(num-2) + FibRecurse(num-1)
    )
    ```

2. How would you change / to return 0 if the denominator is zero?

    ```
    // clone the existing division method
    Number division := Number getSlot("/")

    // overwrite / wrap the "/" operator with the special zero clause
    Number / := method(n, 
        if(n == 0, 0, division(n))
    )
    ```

3. Write a program to add up all of the numbers in a two-dimensional
array.

    ```
    arr := list(list(1,2,3), list(4,5,6), list(7,8,9))
    arr flatten sum
    ```

4. Add a slot called myAverage to a list that computes the average of all the numbers in a list. What happens if there are no numbers in a list? (Bonus: Raise an Io exception if any item in the list is not a number.)

    ```
    List myAverage := method(sum / size)
    arr := list(1,2,3,4,5,6,7)
    arr myAverage println
    ==> 4
    ```
    If there are no numbers in a list, an exception will be thrown with above code. 
    
    We can modify code to prevent this:
    ```
    List myAverage := method(
        if(size == 0, nil, sum / size)
        )
    arr := list()
    arr myAverage println
    ==> nil
    ```

    raise exception if item is not a number
    ```
    List myAverage := method(
        sum := 0
        self foreach(val,
            if(val isKindOf(Number), 
                sum = sum + val, 
                Exception raise("Invalid type - must be a Number type")
            )
        )
        return sum / size
    )
    arr := list(1,2,"five", 5)
    arr myAverage println

    Exception: Invalid type - must be a Number type
    ---------
    Exception raise                      myAverage.io 16
    List myAverage                       myAverage.io 22
    CLI doFile                           Z_CLI.io 140
    CLI run                              IoState_runCLI() 1
    )

    )
    ```
5. Write a prototype for a two-dimensional list. The dim(x, y) method should allocate a list of y lists that are x elements long. set(x, y, value) should set a value, and get(x, y) should return that value.
    ```
    // 2d-list.io
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
    ```
6. Bonus: Write a transpose method so that (new_matrix get(y, x)) == matrix get(x, y) on the original list.

    ```
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
    ```

7. Write the matrix to a file, and read a matrix from a file.

    ```
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
    ```