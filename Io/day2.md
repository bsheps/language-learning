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
