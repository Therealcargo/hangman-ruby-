# List of words to choose from
words = ["apple", "banana", "cherry", "durian", "elderberry", "fig", "grape", "honeydew", "kiwi", "lemon"]

# Choose a random word from the list
secret_word = words.sample

# Initialize the display word with dashes
display_word = "-" * secret_word.length

puts "Welcome to Hangman!"
puts "I'm thinking of a word. Can you guess it?"

# Keep track of the number of guesses and incorrect guesses
num_guesses = 0
incorrect_guesses = []

# Loop until the user guesses the word or runs out of guesses
loop do
  # Display the current state of the word
  puts display_word
  
  # Prompt the user to enter a guess
  print "Enter a letter: "
  guess = gets.chomp.downcase
  
  # Increment the number of guesses
  num_guesses += 1
  
  # Check if the guess is correct
  if secret_word.include?(guess)
    puts "Correct!"
    
    # Replace the dashes in the display word with the guessed letter
    secret_word.split("").each_with_index do |letter, index|
      if letter == guess
        display_word[index] = guess
      end
    end
    
    # Check if the user has guessed the word
    if display_word == secret_word
      puts "Congratulations! You guessed the word '#{secret_word}' in #{num_guesses} guesses."
      break
    end
  else
    puts "Incorrect! Try again."
    
    # Add the incorrect guess to the list
    incorrect_guesses << guess
    
    # Check if the user has run out of guesses
    if incorrect_guesses.length >= 6
      puts "Sorry, you ran out of guesses. The word was '#{secret_word}'."
      break
    end
  end
  
  # Display the list of incorrect guesses
  puts "Incorrect guesses: #{incorrect_guesses.join(", ")}"
end
