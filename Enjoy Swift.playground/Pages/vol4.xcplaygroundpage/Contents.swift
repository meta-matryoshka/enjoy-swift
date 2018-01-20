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


// getter,setterを追加する
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

// 呼び出されるまでプロパティのセットを必要としない場合はwillSetを使う
// 以下のクラスでは、三角形の横幅と四角形の横幅は常に同じとなる

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)




// カスタムクラスのインスタンス変数も、他のクラスと同様にoptionalを取ることができる。
// もしも値がnilだった場合は、"?"以降の処理は無視される
// => nil.sideLengthが呼び出されてしまい、nil落ちするということはない
// optionalを使って導き出された値はすべてoptionalな値となる。 => "sideLength"はoptional

var optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
var sideLength = optionalSquare?.sideLength
optionalSquare = nil
sideLength = optionalSquare?.sideLength
//: [Next](@next)
