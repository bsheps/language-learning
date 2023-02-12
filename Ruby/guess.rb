number = rand(10)

puts "Guess a number between 0 and 9."

guess = gets

while guess.to_i != number
    if guess.to_i < number
        puts "too low"
    else
        puts "too high"
    end
    guess = gets
end

puts "Correct"

