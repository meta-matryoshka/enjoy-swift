//: [Previous](@previous)

//: **ProtocolsとExtensions**
// "protocol"というキーワードを使うことでprotocolを作ることができます。
// protocolはclassやstructureに継承させることができます。

// protocolの作成
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// クラスに継承
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

// structureに継承
struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// structureやenumはそれ自体が値を持つため(参照ではなく)、インスタンスメソッド内でpropertyを変更することはできない。
// ですが、"mutating"キーワードを使うことで、自身の値を書き換えることができます。

// TODO EXPERIMENT



// protocolは、既存の型を拡張することもできる

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}

var num = 7

print(num.simpleDescription)
num.adjust()

// 7.adjust()はできない。一度変数に入れてからじゃないとmutatingは効かない。
// ソースコード上の"7"という記述は不変だから？

// TODO EXPERIMENT


// Protocolに記述されている振る舞い以外を使わない場合は、以下のようにProtocolを指定することで
// Classの振る舞いを制限することができます。
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)

// 以下のanotherPropertyはclassには書かれているが、protpcolにないので使うことができない
// print(protocolValue.anotherProperty)

let instanceValue: SimpleClass = a
print(instanceValue.simpleDescription)
print(instanceValue.anotherProperty)

// これにより、protocolに準拠しないpropertyなどを誤って呼び出すことを防げます。
//: [Next](@next)
