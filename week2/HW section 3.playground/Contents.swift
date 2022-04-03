//3. Protocol in Swift
protocol PoliceMan {
    func arrestCriminals() -> Void
}


struct Person: PoliceMan {
    var name: String
    var toolMan: ToolMan
    
    func arrestCriminals() -> Void {
        print("go to the jail")
    }
    
}

protocol ToolMan {
    func fixComputer() -> Void
}

struct Engineer: ToolMan {
    func fixComputer() {
        print("Do you want me to bring breakfast for you?")
    }
}
let softEngineer = Engineer()
let person = Person(name: "Steven", toolMan: softEngineer)
