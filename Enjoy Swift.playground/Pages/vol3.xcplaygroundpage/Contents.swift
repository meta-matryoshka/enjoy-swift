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
// * 別名ラベル→呼び出し時にのみ利用
// * 元名ラベル→関数の処理の中でのみ利用


// 関数の返値として複数の値を返したい場合は、tupleを使える
// tupleの例
let HTTP404 = (code: 404,description: "Not Found")
print(HTTP404.code)
print(HTTP404.description)

// tupleを返す関数
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [1, 9, 4, 7])

print(statistics.min)
print(statistics.max)
print(statistics.sum)
print(statistics)


// 関数を関数の返り値として記述する
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(10)


//関数の引数に関数を入れる
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}


func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]

hasAnyMatches(list: numbers, condition: lessThanTen)



//関数はクロージャの一種です。(関数とは、後から呼ばれるコードの塊)
//クロージャは全体を{}で囲むことで、名前なしで作成することができます。
//けれど、そうするとクロージャの"(引数) -> 返り値" と本体を区切る記号{}が被ってしまいます。
//そこで、このような場合は区切り文字として"in"を使います。

numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})


//クロージャのタイプが既にわかっている場合は、引数と返り値の宣言を省略することができます。
//以下のように１行で記述が済む場合は return も省略可能。
let mappedNumbers = numbers.map({ number in 3 * number })


// パラメータに対して、名前を使わずに番号でアクセスすることも可能です。
// クロージャが唯一の引数である場合は()を省略することも可能です。

let sortedNumbers = numbers.sorted { $0 < $1 }
print(sortedNumbers)

// TODO クロージャの説明をもう少し深く
//: [Next](@next)
