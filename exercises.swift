
struct NegaiveAmountError: Error {}

func change(_ amount: Int) -> Result<(Int, Int, Int, Int), NegaiveAmountError> {
    if amount < 0 {
        return .failure(NegativeAmountError())
    }
    let (quarters, afterQuarters) = amount.quotientAndRemainder(dividingBy: 25)
    let (dimes, afterDimes) = afterQuarters.quotientAndRemainder(dividingBy: 10)
    let (nickels, pennies) = afterDimes.quotientAndRemainder(dividingBy: 5)
    return .success((quarters, dimes, nickels, pennies))
}

extension String {
  var stretched: String{
  return self
    .filter { !$0.isWhitespace }
    .enumerated().map { pair in return String(repeating: pair.element, count: pair.offset + 1)}
    .joined()
  }
}

extension Array {
  func mapThenUniqe<T>(_ mapper: (Element) -> T) -> Set<T> {
    return Set(self.map{return mapper($0)})
  }
}

func powers(of base: Int, though limit: Int, consume: (Int)->Void){
    var power = 1
    while power <= limit {
      consume(power)
      power *= base
    }
}

protocol Animal {
  var name: String { get }
  var sound: String { get }
}

extension Animal {
  func speak() -> String { return "\(self. name) says \(self.sound)"}
}

struct Cow: Animal {
  let name: String
  let sound ="moooo"
}

struct House: Animal {
  let name: String
  let sound = "neigh"
}

struct Sheep: Animal {
    let name: String
    let sound = "baaaa"
}

struct Sayer{
    var phrase: String
    func and(_moreWords: String) -> Sayer {
     return Sayer(phrase: "\(phrase)\(moreWords)")
    }
}

func say() -> String {
  return ""
}

func say(_phrase: String) -> Sayer {
    return Sayer(phrase: phrase)
}

func twice<T>(_ f: (T) -> T,AppliedTo x: T) -> T {

}

func uppercasedFirst(of x:[String], lonferThan length: Int) -> String? {

}
