//: [Previous](@previous)

//: **Generics**
// 引数に渡す値の型が未定な場合、関数名の後ろに<Name>をつけることでgeneric関数を作ることができます。
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)
makeArray(repeating: 12, numberOfTimes: 4)

// genericは関数だけでなく、classやenum、sturctureでも使用できます
// optional型の再発明
// TODO 解説が必要
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)




// genericsが取り得る値の要件(protocol)を記述する場合は、
// bodyの前に"where"キーワードと、protocolの要件を記載する。
// TODO T.Iterator.Element == U.Iterator.Elementは何がイコールであることを要件としているのか？
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
anyCommonElements([1, 3.9, 3], [3.9])
// TODO EXPERIMENT

// <T: Equatable>と記載するのと、<T> ... where T: Equatableと記載するのは同じ振る舞いをする
// どちらも取り得る値のprotocol要件を記載している

//: [Next](@next)

