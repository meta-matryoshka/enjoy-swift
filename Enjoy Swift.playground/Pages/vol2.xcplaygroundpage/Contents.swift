//: [Previous](@previous)
//: **Optionalを判定する(??)**
var nickName: String? = "Taka"
let fullName = "takafumi kimura"

var unformalMessage = "Hi!" + (nickName ?? fullName)

print(unformalMessage)

nickName = nil
var formalMessage = "Hi!" + (nickName ?? fullName)
print(formalMessage)
//: **Switch文**
// SwiftではInt以外の値もcase判定で使えます
// default: の指定は必須

let enginnerType = "iOS Developer"

switch enginnerType {
case "iOS Developer":
    print("モバイルは世界を変える")
case "Infra Enginner":
    print("インフラはいつの時代でも必要")
case "Web Developer":
    print("オープンイノベーション")
default:
    print("Technorogy change the world")
}


//: [Next](@next)
