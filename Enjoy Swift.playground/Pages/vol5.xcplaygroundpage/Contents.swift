//: [Previous](@previous)

//: **EnumerationsとStructures**
// "enum"というキーワードを使うことでenumを作ることができます。
// Swiftでは0から自動的に1ずつインクリメントした値をアサインします。
// 明示的に値をアサインしたい場合は、下のように指定しましょう(case ace = 1)
// (ace以降の値は1ずつインクリメント)
// enumの値に対して共通のfuncを作ることもできる

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    // Rankの説明を出力するfunction
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    
    // Rankの値を比較するfunction
    func compare(rank:Rank) -> String {
        if rank == self {
            return "same"
        }
        if rank.rawValue > self.rawValue {
            return "bigger"
        }else{
            return "smaller"
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue
ace.simpleDescription()

let two = Rank.two
let twoRawValue = two.rawValue
two.simpleDescription()

let queen = Rank.queen
queen.compare(rank:ace)
ace.compare(rank:queen)
ace.compare(rank:ace)


// あまり意味がないが、以下のようにStringでEnumを作ることもできる
// この場合、rawValueはそのまま要素の名前を返す
enum Status: String {
    case create,review,approved,closed
}

let create = Status.approved.rawValue



//: [Next](@next)
