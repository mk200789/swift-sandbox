// Playground - noun: a place where people can play

import UIKit

//**********************************
// WHILE LOOP
//**********************************

var i = 1

while(i < 10){
    print(i)
    i++
}

var j = 1
while (j <= 10){
    print(j*5)
    print("\n")
    j++
}

var arr = [9, 3, 1, 9, 3, 8]

var k = 0

while (k < arr.count){
    print(arr[k])
    k++
}


/*
Challenge: array of 7 numbers, subtract one from each.
*/

var l = 0

var arr2 = [3, 5, 9, 7 , 1, 23, 8]

while (l < arr2.count){
    arr2[l] = arr2[l] - 1
    print(arr2[l])
    l++
}