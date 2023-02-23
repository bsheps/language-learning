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

// Toy testing framework from scratch
IoTest := Object clone

IoTest assertEquals := method(test, control,
    if(test == control,
        "pass",
        Exception raise("Test failed")
    )
)

IoTest testFibLoop := method(
    "testFibLoop: " println
    assertEquals( FibLoop(1), 1)
    assertEquals( FibLoop(2), 1)
    assertEquals( FibLoop(3), 2)
    assertEquals( FibLoop(4), 3)
    assertEquals( FibLoop(5), 5)
    assertEquals( FibLoop(6), 8)
    assertEquals( FibLoop(7), 13)
    assertEquals( FibLoop(8), 21)
    assertEquals( FibLoop(9), 34)
    assertEquals( FibLoop(25), 75025)
    assertEquals( FibLoop(30), 832040)
    "Pass" println
)

IoTest testFibRecurse := method(
    "testFibRecurse: " println
    assertEquals( FibRecurse(1), 1)
    assertEquals( FibRecurse(2), 1)
    assertEquals( FibRecurse(3), 2)
    assertEquals( FibRecurse(4), 3)
    assertEquals( FibRecurse(5), 5)
    assertEquals( FibRecurse(6), 8)
    assertEquals( FibRecurse(7), 13)
    assertEquals( FibRecurse(8), 21)
    assertEquals( FibRecurse(9), 34)
    assertEquals( FibRecurse(25), 75025)
    assertEquals( FibRecurse(30), 832040)
    "Pass" println
)

IoTest testFibLoop
IoTest testFibRecurse