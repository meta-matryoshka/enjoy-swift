//: [Previous](@previous)

//: **Error Handling**
// Errorというprotocolを使うことで、どのような型であってもerrorを表現することができます
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// "throw"でエラーをthrowすることができ、"throws"でerrorをthrowすることができるfunctionであることをマークすることができます。
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    
    if printerName == "On Fire" {
        throw PrinterError.onFire
    }
    return "Job sent"
}

// do-catchによるエラーの捕捉
// throwできる関数の前で"try"と記載することで、エラーをキャッチします。
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}


do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}

// 複数のエラーパターンで処理を分ける
do {
    let printerResponse = try send(job: 1440, toPrinter: "On Fire")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
    // TODO この as は型チェックをしている？
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

// "try?"を使ってエラーを補足する
// この場合、エラーを補足したら特定のエラーに関する情報ではなくnilを返す
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

// deferについて
// functionがエラーを飛ばすかどうかに関わらず、deferで記載されたコードは関数の終了直前に必ず実行される

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)






//: [Next](@next)

