//: **Hello,world**
print("Hello,world")
//: **変数と定数**
var message = "iOSアプリを作りたい"
print(message)

let companyName = "Apple"
print(companyName)
//: **型推論**
// 変数/定数の型は、初期値が明らかな場合に省略することができる。
var lastName: String = "kimura"
var firstName = "takafumi"

print(String(describing: type(of: lastName)))

print(String(describing: type(of: firstName)))
//: **型情報の取得方法**
print(String(describing: type(of: firstName)))
//: **型変換**
var easyPi = 3
print(easyPi)
print(String(describing: type(of: easyPi)))

print(Double(easyPi))

var pi = Double(easyPi) + 0.14
print(pi)
print(String(describing: type(of: pi)))

//: **文字列の中に変数を入れる**
var age = 29
print("私の年齢は \(age)才です。")
//: **改行を含む文字列**
// このSyntaxはSwift4以降で対応しています。
// エラーが発生する場合、Xcode9以降を入手し、本ファイルを開いてください。
// 参考 => https://developer.apple.com/xcode/

var longTextMessage = """
1行目
2行目
3行目
"""

print(longTextMessage)

print(String(describing: type(of: longTextMessage)))
// 型はStringのまま
//: **Array**
var languages = ["Swift","Java","Ruby","JavaScript","Go"]
print(String(describing: type(of: languages)))

var numbers = [1,2,3,4,5,6,7,8]
print(String(describing: type(of: numbers)))

print(languages[1])

print(languages)

languages[1] = "Kotlin"
print(languages)
//: **Dictionary**
var colors = ["青":"blue","緑":"green"]
print(String(describing: type(of: colors)))

print(colors)
colors["白"] = "white"
print(colors)
//: **Array/Dictonaryを空で宣言**
let emptyArray = [String]()
print(String(describing: type(of: emptyArray)))

let emptyDictionary = [String: Float]()
print(String(describing: type(of: emptyDictionary)))
//: **for in**
let values = [1,2,3,4,5]
var sum = 0
for specificValue in values {
    sum += specificValue
}
print(sum)


//: **if statement**
var score = 80
var resultMessage = ""
if score >= 75 {
    resultMessage = "合格です🎉"
}else{
    resultMessage = "不合格です😢"
}

print(resultMessage)


//: **Optionals**
// nil値が含まれる可能性がある値は、optionalsとして扱われる。
// 値の型の後ろに(?)マークをつけることで、宣言できる。

var optionalScore: Int?


if let actualScore = optionalScore {
    if actualScore > 75 {
        resultMessage = "合格です🎉"
    }else{
        resultMessage = "不合格です😢"
    }
    
}else{
    resultMessage = "試験未受験です😤"
}

print(resultMessage)

// optionalScoreがnilの場合は
// let actualScore = optionalScore の結果はfalseが返る
// optionalScoreに値を入れると、以下の通り

optionalScore = 60

if let actualScore = optionalScore {
    if actualScore > 75 {
        resultMessage = "合格です🎉"
    }else{
        resultMessage = "不合格です😢"
    }
    
}else{
    resultMessage = "試験未受験です😤"
}

print(resultMessage)

//: [Next](@next)
