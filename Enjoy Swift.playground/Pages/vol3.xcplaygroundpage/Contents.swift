//: [Previous](@previous)
//: **関数**
func fullName(firstName: String, lastName: String) -> String{
    return "\(lastName) \(firstName)"
}

fullName(firstName: "takafumi", lastName: "kimura")

// 関数の引数にはラベル(firstName , lastName)が必要


// 引数のラベルを省略する場合は以下のように、ラベルの前に"_"を書く
func bmi(_ weight: Double,_ hight: Double) -> Double{
    return weight / (hight*hight)
}

bmi(70, 1.7)
// ラベルありの方が、呼び出し時に引数の性質を理解しやすい。

// 引数ラベルに別名をつけるときは、ラベルの前に別名を書く
func displayMessage(sales: Int , in month:Int){
    "\(month)月度売上 : \(sales)万円"
}

displayMessage(sales: 200, in: 8)
// 注意点
// * 別名ラベル(in)をつけると、呼び出し時に元のラベル(month)は使えなくなる
// * 別名ラベル(in)をつけても、関数の処理内で別名は使えない。(元のラベル(month)を使う)

// まとめ
// * 別名→呼び出し時にのみ利用
// * 元名→関数の処理の中でのみ利用

















//: [Next](@next)
