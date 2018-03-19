//: Playground - noun: a place where people can play

import UIKit

func calculator (n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

func add(n1: Int, n2: Int) -> Int {
    return n1 + n2
}

func mutiply(n1: Int, n2: Int) -> Int {
    return n1 * n2
}

calculator(n1: 2, n2: 3, operation: add)
calculator(n1: 2, n2: 3, operation: { (n1: Int, n2: Int) -> Int in
    return n1 + n2
})
calculator(n1: 2, n2: 3, operation: mutiply)
calculator(n1: 2, n2: 3, operation: { (n1: Int, n2: Int) -> Int in
    return n1 * n2
})

let result01 = calculator(n1: 2, n2: 3, operation: {$0 * $1})
print(result01)

let result02 = calculator(n1: 2, n2: 3) {$0 * $1}
print(result02)

// ----------------------------------------------------------

let array = [6, 2, 3, 9, 4, 1]

func addOne(n1: Int) -> Int {
    return n1 + 1
}

let tempArray01 = array.map(addOne)
print(tempArray01)

let tempArray02 = array.map({ (n1: Int) -> Int in
    return n1 + 1
})
print(tempArray02)

let tempArray03 = array.map({ (n1) in
    return n1 + 1
})
print(tempArray03)

let tempArray04 = array.map{$0 + 1}
print(tempArray04)

let stringifiedArray = array.map{"\($0)"}
print(stringifiedArray)

