// Playground - noun: a place where people can play

import UIKit

//**********************************
//FOR LOOPS
//**********************************

//loop forward
for var i = 1; i < 10; i++ {
    print("\(i) ")
}

//loop backwards
for var i = 20; i > 10; i-- {
    print("\(i) ")
}

/*
Print even numbers from 2 to 20
*/

print("\nEven numbers from 2 to 20 are: ")
for var i = 2; i <= 20; i++ {
    if ( i % 2 == 0){
        print("\(i) ")
    }
}

/*
Loop through elements in an array
*/

var arr = [39, 43, 89, 55]

for x in arr {
    print("\(x) ")
}


/*
Increment each element by 1.
In swift 2 : arr.enumerate()
*/

for (index, value) in enumerate(arr){
    arr[index] = value + 1
}


/*
Challenge
*/

var arr2 = [20, 12, 84, 94]

for (index, value) in enumerate(arr2){
    arr2[index] = value/2;
}