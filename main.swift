
import Foundation

// First check ensures you defined your own struct NegativeAmountError
assert(change(200) is Result<(Int, Int, Int, Int), NegativeAmountError>)
assert(try! change(0).get() == (0, 0, 0, 0))
assert(try! change(97).get() == (3, 2, 0, 2))
assert(try! change(8).get() == (0, 0, 1, 3))
assert(try! change(250).get() == (10, 0, 0, 0))
assert(try! change(144).get() == (5, 1, 1, 4))
assert(try! change(97).get() == (3, 2, 0, 2))
assert(try! change(100000000000).get() == (4000000000, 0, 0, 0))
assert((try? change(-50).get()) == nil)

assert("".stretched == "")
assert("  ".stretched == "")
assert("  \t\n  \t".stretched == "")
assert("  Hi  hi  ".stretched == "Hiihhhiiii")
assert("😁😂😱".stretched == "😁😂😂😱😱😱")
assert("hello world".stretched ==
    "heelllllllooooowwwwwwooooooorrrrrrrrllllllllldddddddddd")

assert([].mapThenUnique { Int($0) * $0 } == Set([]))
assert([2, 9, -9, 3].mapThenUnique { Int($0) * $0 } == Set([4, 9, 81]))
assert(["abc", "Hi", "AbC"].mapThenUnique { $0.lowercased() } == Set(["hi", "abc"]))
assert(["33", "21", "33"].mapThenUnique { Int($0) } == Set([21, 33]))

var scratch = [Int]()
powers(of: 2, through: 64) { scratch.append($0) }
assert(scratch == [1, 2, 4, 8, 16, 32, 64])
scratch.removeAll()
powers(of: 2, through: 63) { scratch.append($0) }
assert(scratch == [1, 2, 4, 8, 16, 32])
scratch.removeAll()
powers(of: -3, through: 300) { scratch.append($0) }
assert(scratch == [1, -3, 9, -27, 81, -243])

let h: Animal = Horse(name: "CJ")
assert(h.speak() == "CJ says neigh")
let c: Animal = Cow(name: "Bessie")
assert(c.speak() == "Bessie says moooo")
assert(Sheep(name: "Little Lamb").speak() == "Little Lamb says baaaa")

// Test that Animal really is a protocol with the default method
struct Rat: Animal {
    let name: String
    let sound = "squeak"
}
assert(Rat(name:"Oreo").speak() == "Oreo says squeak")

assert(say("A").phrase == "A")
assert(say("A").and("B").phrase == "A B")
assert(say("🐤🦇").and("$🦊👏🏽").and("!").phrase == "🐤🦇 $🦊👏🏽 !")

assert(twice({$0 * 2}, appliedTo: 5.0) == 20.0)
assert(twice({s in s + "ee"}, appliedTo: "b") == "beeee")

assert(uppercasedFirst(of: [], longerThan: 5) == nil)
assert(uppercasedFirst(of: ["🎃"], longerThan: 1) == nil)
assert(uppercasedFirst(of: ["a", "bcdef"], longerThan: 5) == nil)
assert(uppercasedFirst(of: ["a", "abcdef", "g"], longerThan: 5) == Optional.some("ABCDEF"))
assert(uppercasedFirst(of: ["ab", "abcf"], longerThan: 1) == Optional.some("AB"))

print("All tests passed")
