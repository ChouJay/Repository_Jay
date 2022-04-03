// Error Handling in Swift
enum GuessNumberGameError: Error {
    case wrongNumber
}
class GuessNumberGame {
    var targetNumber = 10
    func guess(number: Int) throws {
        guard number == targetNumber else {
            throw GuessNumberGameError.wrongNumber
}
        print("Guess the right number: \(targetNumber)")
    }
}

let game = GuessNumberGame()

do {
    try game.guess(number: 20)
} catch GuessNumberGameError.wrongNumber {
    print("Go home!")
}

//try game.guess(number: 20) //Playground execution terminated: An error was thrown and was not caught
try game.guess(number: 10)
