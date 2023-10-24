import Foundation

func main() {
    var secretNumber: Int, guess: Int, attempts = 0
    var minRange: Int = 1, maxRange: Int = 10
    var maxAttempts = 5
    var score = 0

    print("Choose a difficulty level:")
    print("1. Easy (1-10)")
    print("2. Medium (1-50)")
    print("3. Hard (1-100)")
    print("4. Impossible (1-1000")
    guard let difficultyStr = readLine(), let difficulty = Int(difficultyStr) else {
        print("Invalid input. Exiting...")
        return
    }

    switch difficulty {
    case 1:
        minRange = 1
        maxRange = 10
        maxAttempts = 5
    case 2:
        minRange = 1
        maxRange = 50
        maxAttempts = 7
    case 3:
        minRange = 1
        maxRange = 100
        maxAttempts = 10
        
    case 4:
        minRange = 1
        maxRange = 1000
        maxAttempts = 100
    default:
        print("Invalid choice. Exiting...")
        return
    }

    secretNumber = Int.random(in: minRange...maxRange)

    print("Welcome to the Number Guessing Game!")
    print("I've chosen a number between \(minRange) and \(maxRange).")

    while attempts < maxAttempts {
        print("Attempts left: \(maxAttempts - attempts)")
        print("Enter your guess: ", terminator: "")
        guard let guessStr = readLine(), let userGuess = Int(guessStr) else {
            print("Invalid input. Please enter a number.")
            continue
        }
        guess = userGuess
        attempts += 1

        if guess < secretNumber {
            print("Too low! Try again.")
        } else if guess > secretNumber {
            print("Too high! Try again.")
        } else {
            print("Congratulations! You guessed the number \(secretNumber) in \(attempts) attempts!")
            score = maxAttempts - attempts + 1
            break
        }
    }

    if attempts == maxAttempts {
        print("Sorry, you've run out of attempts. The correct number was: \(secretNumber)")
    }

    print("Your score is: \(score)")
}

main()
