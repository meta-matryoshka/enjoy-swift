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

let approved = Status.approved.rawValue

// Rank(rawValue: n)でenumのインスタンスを作成できる
// 該当するrawValueがなければnilとなるため、これはoptionalな値
var three = Rank(rawValue: 3)
var thirty = Rank(rawValue: 30)

// "var three"はoptionalなので(enumのインスタンス生成はnilとなる可能性がある)、以下のようにunwrappedする
if let convertedRank = three {
    let threeDescription = convertedRank.simpleDescription()
    print(threeDescription)
}

// 意味のあるrawValueを与える必要がないときには、rawValueは提供する必要がない
enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
let color = Suit.clubs.color()




//: [Next](@next)
