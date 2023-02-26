input := File clone standardInput

random := Random value(1,100) floor // imported via eerie package manager
"Guess a number between 1 and 100: " println

for(i, 1, 10,
    guess := input readLine asNumber
    if(guess == random,"Correct" println; break) 
    if(guess < random, "Hotter" println, "Colder" println)
)

writeln("Game Over.")

input close