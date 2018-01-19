//: [Previous](@previous)

//: **オブジェクトとクラス**
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// クラス名の後ろに()をつけると、インスタンスを作成できます
var shape = Shape()

// 作成したインスタンスに対してドットを使うことで中のfunctionやプロパティへアクセスができます
shape.simpleDescription()

// イニシャライザを含んだクラス
// インスタンス生成時にinitの値がセットされる
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var namedShape = NamedShape(name: "💮")
namedShape.name

// init(name: String) {
//     self.name = name
// }
// クラス内のnameとinit引数のnameを区別するために、selfを使っている。


//サブクラスは、コロンに続いてsuperクラス名を記載することで作成することができる

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        // スーパークラスのinitalizerを呼び出す
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    // superクラスのメソッドをoverrideするときにはコンパイラの間違いチェックを通すために"overrride"と明示的に書く必要がある。
    // 安全設計
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

// 練習
class Circle : NamedShape {
    var redius : Double
    
    init(name: String, radius: Double) {
        self.redius = radius
        // スーパークラスのinitializerは最後に呼び出さないと、チェックが走ってエラーになる
        // そのため、rediusの初期化は先にしておく
        super.init(name: name)
    }
    
    func area() -> Double {
        return redius * redius * 3.14
    }
    
    override func simpleDescription() -> String {
        return "A cicle with no sides of length."
    }
}

var cicle = Circle(name: "ball", radius: 5)
cicle.area()

















//: [Next](@next)
