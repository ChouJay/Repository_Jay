//HW 4-2
var isOdd: (Int) -> Bool = {(number: Int) -> Bool in
    if number%2 != 0 {
        return true
    } else {
        return false
    }
}

isOdd(3)
