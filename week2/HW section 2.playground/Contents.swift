//Enumerations and Optionals in Swift
// 1.
// 1-1: create enum Gasoline, 1-3: raw value for Gasoline

import Darwin
enum Gasoline: String {
    case oil92 = "92"
    case oil95 = "95"
    case oil98 = "98"
    case diesel = "diesel"
// 1-2: create method named getPrice
    func getPrice(price: Gasoline) -> Int {
        switch price {
        case .oil92:
            print("The price is 30 $/L")
            return 30
        case .oil95:
            print("The price is 33 $/L")
            return 33
        case .oil98:
            print("The price is 35 $/L")
            return 35
        case .diesel:
            print("The price is 25 $/L")
            return 25
        }
    }
}

let gasoLines: Gasoline = .oil92
gasoLines.getPrice(price: gasoLines)

// 1-4: explain enum assoicated value
//相關值即是programmer定義，對應列舉中每個成員所賦予的其他型別的值。列舉中的每個成員，可以在需要的時候，一併儲存自定義的一個或以上其他型別的相關值，往後在程式中將該列舉中的成員指派給變數或常數時，這個(或這些)相關值才會被設置。
//在使用switch語句匹配列舉值時，可以把相關值取出作為常數(let)或變數(var)使用，enum只會有raw value或是associated value，不能同時兩個都有。

// 2.
// 2-1.
class Pet {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
class People {
    var pet: Pet?
    
//    init(pet: Pet) {
//        self.pet = pet
//    }
}
let dog = Pet(name: "Lucky")
//var people = People(pet: dog)
//print(people.pet!.name)

//2-2
let people1 = People()
func getPetName() {
guard let pet1 = people1.pet else {
    print("dont have a pet")
    return
}
print("People1 have a pet named \(pet1.name)")
}
getPetName()


//2-3
let people2 = People()
people2.pet = dog
if let pet2 = people2.pet {
    print("People have a pet named \(pet2.name)")
} else {
    print(("No pet!"))
}
