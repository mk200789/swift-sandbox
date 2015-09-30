// Playground - noun: a place where people can play

import UIKit

//**********************************
//FOR LOOPS
//**********************************

//loop forward
for var i = 1; i < 10; i++ {
    print("\(i)\n")
}

//loop backwards
for var i = 20; i > 10; i-- {
    print("\(i)\n")
}

/*
Print even numbers from 2 to 20
*/

print("Even numbers from 2 to 20 are: ")
for var i = 2; i <= 20; i++ {
    if ( i % 2 == 0){
        print("\(i)\n")
    }
}