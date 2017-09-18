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


//: **Dictionaryのfor in**
let foods = [
    "fruiets"    :   ["apple","banana","remon"],
    "vegitables" :   ["poteto","onion","tomato"],
    "meet"       :   ["chicken","pork","beef"]
]

for (kind,items) in foods {
    print(kind)
    for item in items {
        print(item)
    }
}

// for (key,values) in dictionaryValues
// という構文を使うと、key,valuesを同時にfor文の中で回せる
// 繰り返しの順番はアルファベット順
//: **while文**
var days = 7
while days < 30 {
    days += 5
}
print(days)


//: **repeat-while文**
var weeks = 7

repeat{
    weeks += 5
} while weeks < 3

print(weeks)

// 最低でも必ず一回は実行させたい処理の場合、この表現が使えます。













//: [Next](@next)
