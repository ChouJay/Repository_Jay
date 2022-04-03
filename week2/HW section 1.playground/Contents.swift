// 1.
enum Gender {
    case male
    
    case female
    
    case undefined
}

class Animal {
    let gender: Gender
    
    init() {
        gender = .male
    }
    init(gender: Gender) {
        self.gender = gender
    }
    func eat() {
        print("I eat everything")
    }
}

class Elephant: Animal {
    override func eat() {
        print("I eat tree")
    }
}

class Tiger: Animal {
    override func eat() {
        print("I eat pig")
    }
}

class Horse: Animal {
    override func eat() {
        print("I eat weed")
    }
}
let elephant = Elephant(gender: .male)
let tiger = Tiger(gender: .male)
let horse = Horse(gender: .male)
//
//let array = [elephant, tiger, horse]
class Zoo {
    var weeklyHot: Animal
    
    init(weeklyHot: Animal) {
        self.weeklyHot = weeklyHot
    }
}

let zoo = Zoo(weeklyHot: Tiger())
zoo.weeklyHot = tiger
zoo.weeklyHot = elephant
zoo.weeklyHot = horse
// check
print(zoo.weeklyHot)
zoo.weeklyHot.eat()

/*
1-4.
Ans:
 Struct是value type，若一個let為struct型別，則此常數不能修改。用struct創建新的實例時，會複製該struct的初始值到新的實例中。
Class是reference type，若一個let為class型別，則此常數仍可以修改。具有inherit的性質，可從父類別繼承property及method。用class創建新的實例時，這些實例中的屬性及方法是參考class中的設定。

1-5.
instance method: 需要先為型別(類別、結構、列舉等等)生成實例，才能透過實例呼叫此方法
type method: 屬於特定(類別、結構、列舉等等)的方法，可直接用點語法呼叫，宣告型別方法時需要加上static在func前面。

1-6.
 建構器(initializer)會在生成一個型別的實例時進行初始化，這個初始化的過程會為實例中的每個屬性依據programmer的定義設置初始值

1-7.
 在實體方法中使用self來代表這個實體，訪問的會是這個實例所有的屬性。在型別方法中，self則是代表該型別本身，訪問的會是型別的屬性

1-8.
 reference type: 在創建實例時，實例皆會參考(共享)同一個型別內的屬性及方法，其原理為這些實例皆指向相同的記憶體位址。當reference type中宣告常數(let)屬性時，其"常數"所代表的意義是"參考位址必須是常數(不可變的)"，因此在參考位址不變的情況下，其中的值是可以改變的。
 value type: 在創建實例時，實例會從該型別複製一份屬於實例自己的屬性及方法，因此每一個實例雖然屬性、方法皆相同，但指向的是不同的記憶體位址，因此在針對屬性或方法做變更時，並不會影響到其他實例。當value type中宣告常數(let)屬性時，其"常數"所代表的意義是"該實例的屬性必須為常數"，因此此常數屬性的值是不可改變的
*/
