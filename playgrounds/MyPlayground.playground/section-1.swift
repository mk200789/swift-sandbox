// Playground - noun: a place where people can play

import UIKit

var num1:Int = 8

var num2:Double = 2.5

print("The product of \(num1) and \(num2) is equal to \(num2 * Double(num1)) .")


/*Prime numbers*/

var number = 61

var isPrime = true

if (number == 1){
    isPrime = false
}
else if (number >= 2){
    var n = 2
    while (n < number){
        if (number%n == 0){
            isPrime = false
        }
        n++
    }
}

print("\(isPrime)\n")
